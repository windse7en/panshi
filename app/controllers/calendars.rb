class Calendars
  
  def self.init
    start_day = 2.months.ago
    end_day = 2.months.from_now 
    event = Event.where(:reserve_start_at=>start_day..end_day)
    result = []
    event.map do |e|
      t = e.product
      te = e.employee
      tc = e.customer
      result.push e.attributes.slice("id","reserve_start_at","reserve_end_at","employee_id","customer_id","product_id", "event_comment").merge("product_name"=>t.product_name, "price"=>t.price,"employee_name"=>te.employee_name,"customer_name"=>tc.customer_name)
    end
    return result
	end

end
