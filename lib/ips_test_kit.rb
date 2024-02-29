Dir.glob(File.join(__dir__, 'ips', '*.rb')).each { |path| require_relative path.delete_prefix("#{__dir__}/") }

module IPS
  class Suite < Inferno::TestSuite
    title 'International Patient Summary (IPS)'
    description %(
      This test suite evaluates the ability of a system to provide patient
      summary data expressed using HL7® FHIR® in accordance with the
      [International Patient Summary Implementation Guide (IPS
      IG)](https://www.hl7.org/fhir/uv/ips/).  
    )

    id 'ips'

    validator do
      url ENV.fetch('VALIDATOR_URL', 'http://validator_service:4567')
    end

    links [
      {
        label: 'Report Issue',
        url: 'https://github.com/inferno-framework/ips-test-kit/issues/'
      },
      {
        label: 'Open Source',
        url: 'https://github.com/inferno-framework/ips-test-kit/'
      },
      {
        label: 'International Patient Summary IG v1.0.0',
        url: 'http://hl7.org/fhir/uv/ips/STU1/'
      }
    ]
    
    # Comment this out to remove
    group from: :ips_resource_validation

    group do
      title 'IPS Operations'

      input :url

      fhir_client do
        url :url
      end

      group from: :ips_document_operation
      group from: :ips_summary_operation
    end

    group do
      title 'IPS Read and Validate Profiles'

      input :url

      fhir_client do
        url :url
      end

      group from: :ips_allergy_intolerance
      group from: :ips_bundle
      group from: :ips_composition
      group from: :ips_condition
      group from: :ips_diagnostic_report
      group from: :ips_device
      group from: :ips_device_observer
      group from: :ips_device_use_statement
      group from: :ips_imaging_study
      group from: :ips_immunization
      group from: :ips_media_observation
      group from: :ips_medication
      group from: :ips_medication_request
      group from: :ips_medication_statement
      group  do
        title 'Observation Profiles'

        group from: :ips_observation_alcohol_use
        group from: :ips_observation_pregnancy_edd
        group from: :ips_observation_pregnancy_outcome
        group from: :ips_observation_pregnancy_status
        group from: :ips_observation_tobacco_use
      end
      group do
        title 'Observation Result Profiles'

        group from: :ips_observation_results
        group from: :ips_observation_results_laboratory
        group from: :ips_observation_results_pathology
        group from: :ips_observation_results_radiology
      end
      group from: :ips_organization
      group from: :ips_patient
      group from: :ips_practitioner
      group from: :ips_practitioner_role
      group from: :ips_procedure
      group from: :ips_specimen

    end
  end
end
