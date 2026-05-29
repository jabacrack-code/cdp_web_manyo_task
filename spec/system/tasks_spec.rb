require 'rails_helper'

RSpec.describe 'Task management function', type: :system do
  describe 'Registration function' do
    context 'When registering a task' do
      it 'The registered task is displayed' do
        visit new_task_path
        fill_in 'Title', with: 'sample title'
        fill_in 'Content', with: 'sample content'
        click_button 'Create Task'
        expect(page).to have_content 'sample title'
        expect(page).to have_content 'sample content'
      end
    end
  end

  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'A list of registered tasks is displayed' do
        task = FactoryBot.create(:task, title: 'Document preparation')
        visit tasks_path
        expect(page).to have_content 'Document preparation'
      end
    end
  end

  describe 'Detailed display function' do
    context 'When transitioned to any task details screen' do
      it 'The content of the task is displayed' do
        task = FactoryBot.create(:task, title: 'Show Task', content: 'Show Content')
        visit task_path(task)
        expect(page).to have_content 'Show Task'
        expect(page).to have_content 'Show Content'
      end
    end
  end
end
