#!/usr/bin/env groovy
// the "!#/usr/bin... is just to to help IDEs, GitHub diffs, etc properly detect the language and do syntax highlighting for you.
// thx to https://github.com/jenkinsci/pipeline-examples/blob/master/docs/BEST_PRACTICES.md

// note that we set a default version for this library in jenkins, so we don't have to specify it here
@Library('misc')
import de.metas.jenkins.MvnConf
import de.metas.jenkins.Misc

// WIP
// TODOs:
// - [ ] get the actual stack to run
// - [x] find and assign free port
// - [ ] when waiting, poll the right URL
// - [ ] invoke the metasfresh-e2e
// - [ ] add parameter to distinguish between "smoke" and "full"
def build(final String dockerComposePath,
          final String e2eDockerImage) {

    stage('test') // for display purposes
            {
                sh "cp ${dockerComposePath}/docker-compose_random_ports.yml ${dockerComposePath}/docker-compose.yml"
                sh "cd ${dockerComposePath} && docker-compose build && docker-compose up -d"

                final String webuiPort = sh label: 'get_webui_port', returnStdout: true, script: 'docker-compose port webui 80'
                // thx to https://stackoverflow.com/a/38157744
                waitUntil {
                    sh "wget --retry-connrefused --tries=120 --waitretry=1 -q http://localhost:${webuiPort}/health -O /dev/null"
                }

                // quick smoke-test only
                final String spec='cypress/integration/currency/currency_activate_spec.js'

                // run metasfresh-e2e job or call the docker image in here
                build job: '/ops/run_e2e_tests',
                        parameters: [string(name: 'MF_TARGET_HOST', value: 'localhost'),
                                     string(name: 'MF_CYPRESS_SPEC', value: spec),
                                     string(name: 'MF_DOCKER_IMAGE_FULL_NAME', value: 'metasfresh/metasfresh-e2e:master_LATEST'),
                                     string(name: 'MF_TARGET_USER', value: 'dev'),
                                     password(name: 'MF_TARGET_PASSWORD', value: 'demo1234'),
                                     booleanParam(name: 'MF_CYPRESS_DASHBOARD', value: true),
                                     booleanParam(name: 'MF_CYPRESS_DEBUG', value: false),
                                     booleanParam(name: 'MF_CYPRESS_CHROME', value: false),
                                     string(name: 'MF_UPSTREAM_BUILD_URL', value: '')]
            }
}

return this
