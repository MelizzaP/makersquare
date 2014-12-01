require 'rest_client'

module MakerBlog
   class Client
      def client_error
        if response.code == 400
          raise "Network Error"
        end 
      end 

      def list_posts
        response = RestClient.get('http://makerblog.herokuapp.com/posts', accept:'application/json')
        posts = JSON.parse(response.body)
        posts.each do |post|
          puts "#{post["name"]}\n#{post["title"]}\n#{post["content"]}\n\n"
        end
        if response.code != 200
          puts "Error"
        end
      end

      def show_post(id)
        url =  'http://makerblog.herokuapp.com/posts/' + id.to_s
        response = RestClient.get(url, accept:'application/json')
        post = JSON.parse(response.body)
        puts "#{post["name"]}\n#{post["title"]}\n#{post["content"]}"
        if response.code != 200
          puts "Error"
        end
      end

      def create_post(name, title,content)
        url = 'http://makerblog.herokuapp.com/posts/'
        payload = {:post =>{'name' => name, 'title'=> title, 'content' => content}}
        response = RestClient.post(url, JSON.generate(payload), accept: 'application/json', content_type: 'application/json')
        puts JSON.parse(response.body)
        if response.code != 201
          puts "Error"
        end
      end

      def edit_post(id, options={})
        url = 'http://makerblog.herokuapp.com/posts/' + id.to_s
        param = {}

        param[:name] = options[:name] unless options[:name].nil?
        param[:title] = options[:title] unless options[:title].nil?
        param[:content] = options[:content] unless options[:content].nil?

        response = RestClient.put(url,{post:param}, accept: 'application/json', content_type:'application/json')
        puts JSON.parse(response.body)
        if response.code != 201
          puts "Error"
        end
      end

      def delete_post(id)
        url = 'http://makerblog.herokuapp.com/posts/'+id.to_s
        response = RestClient.delete(url, accept:'application/json')
        if response.code != 204
          puts "Error"
        else
          puts response.code
        end
    end
  end
end
  
client = MakerBlog::Client.new
# client.list_posts
# client.show_post(19745)
# client.create_post('Joe', 'King of the hill', 'Come on bobby')
# client.edit_post(19745, {name: "Melissa"})
client.delete_post(19691)