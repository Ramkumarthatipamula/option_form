module ApplicationHelper
  def file_upload(certificate)
    if File.exist?(Rails.root.join+"public/uploads/Certificate/#{certificate.student_id}.pdf").present?
      certificate.update(attachment: (Rails.root.join+"public/uploads/Certificate/#{certificate.student_id}.pdf").open)
      return true
    else
      return false
    end
  end
end
