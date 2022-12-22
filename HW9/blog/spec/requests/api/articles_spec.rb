require 'swagger_helper'

RSpec.describe 'api/articles', type: :request do
  path '/api/v1/articles' do
    get('list of articles') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :search, in: :query, schema: { type: :string },
                description: 'search by title or body'
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
                description: 'search by status (published/unpublished)'
      parameter name: :name, in: :query, schema: { type: :string },
                description: 'search by author'
      parameter name: :tags, in: :query, schema: { type: :string },
                description: 'search by tag'
      parameter name: :order, in: :query, schema: { type: :string },
                description: 'sort articles (asc/desc)'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[title body author_id]
      }

      response(201, 'created') do
        let(:article) { { title: 'title', body: 'body', author_id: '1' } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show article') do
      tags 'Articles'
      consumes 'application/json'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer },
          status: { type: :string, enum: %w[unpublished published] }
        },
        required: false
      }

      response(200, 'successful') do
        describe 'PUT api/v1/articles{id}' do
          it 'check put article' do
            article.update(status: 'published')
            expect(Article.find_by(status: 'published')).to eq(article)
          end
        end
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete article') do
      tags 'Articles'
      response(200, 'successful') do
        describe 'DELETE api/v1/articles{id}' do
          it 'delete article' do
            article.destroy
            expect(Article.find_by_id('id')).to eq(nil)
          end
        end
        run_test!
      end
    end
  end
end
