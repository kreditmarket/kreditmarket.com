class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :personal_last_name
      t.string :personal_first_name
      t.string :personal_surname
      t.date :personal_birth_date
      t.string :personal_birth_place
      t.string :personal_relationship_status
      t.string :personal_education
      t.string :personal_inn
      t.integer :personal_izhd_count
      
      t.string :doc_seria
      t.string :doc_number
      t.date :doc_date
      t.string :doc_author
      
      t.string :reg_region
      t.string :reg_city
      t.string :reg_street
      t.string :reg_house
      t.string :reg_building
      t.string :reg_flat
      t.string :reg_phone
      
      t.string :fact_region
      t.string :fact_city
      t.string :fact_street
      t.string :fact_house
      t.string :fact_building
      t.string :fact_flat
      t.string :fact_phone
      t.string :fact_period
      t.string :fact_st_phone
      t.string :fact_mob_phone
      
      t.string :fisrt_cont_per_last_name
      t.string :fisrt_cont_per_first_name
      t.string :fisrt_cont_per_surname
      t.string :fisrt_cont_per_relatives_level
      t.string :fisrt_cont_per_st_phone
      t.string :fisrt_cont_per_mob_phone
      t.string :second_cont_per_last_name
      t.string :second_cont_per_fist_name
      t.string :second_cont_per_surname
      t.string :second_cont_per_relatives_level
      t.string :second_cont_per_st_phone
      t.string :second_cont_per_st_phone
      
      t.string :inc_activity_sphere
      t.string :inc_record_of_service
      t.string :inc_post
      t.string :inc_salary
      t.string :inc_org_name
      t.string :inc_org_city
      t.string :inc_org_street
      t.string :inc_org_house
      t.string :inc_org_building
      t.string :inc_org_office
      t.string :inc_org_phone
      t.string :inc_org_site 
      
      t.integer :amount
      t.integer :return_term
      
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
