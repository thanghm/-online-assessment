class BalancedsController < ApplicationController
	def valid_string?(string)
	  open_paren = ['[','{','(']
	  close_paren = [']','}',')']
	  open_close_hash = {"]"=>"[", "}"=>"{", ")"=>"("}
	  stack = []
	  regex = Regexp.union(close_paren+open_paren)
	  string.scan(regex).each do |char|
	    if open_paren.include? char
	      stack.push(char)
	    elsif close_paren.include? char
	      pop_val = stack.pop
	      return false if pop_val != open_close_hash[char]
	    end
	  end
	  open_paren.none? { |paren| stack.include? paren }
	end

	def check
		@balanceds = params[:text]
    if @balanceds.present?
    	@balan = valid_string?(@balanceds)
      flash[:error] = "#{@balan}"
    end
	end 
end
