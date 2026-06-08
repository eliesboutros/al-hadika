module WhatsappHelper
  WHATSAPP_NUMBER = "96179365375"

  MESSAGES = {
    general:          { keyword: "INSPECT",      text: "Hello, I would like to schedule a free inspection." },
    general_pest:     { keyword: "PEST",         text: "Hi! I am interested in learning more about your General Pest Control service. I would love to discuss the options available and possibly schedule a free inspection. Thank you!" },
    termite:          { keyword: "TERMITE",      text: "Hello! I would like to learn more about your termite control services. Could we discuss the different treatment options you offer? I am also interested in scheduling a free inspection. Thanks!" },
    bed_bug:          { keyword: "BEDBUG",       text: "Hi there! I would like to discuss your bed bug treatment services. Could you share information about your treatment methods? Thank you!" },
    cockroach:        { keyword: "COCKROACH",    text: "Hi! I would like to learn more about your cockroach control services. Could you share information about your treatment methods and what to expect? I would love to schedule a free inspection. Thank you!" },
    rodent:           { keyword: "RODENT",       text: "Hello! I would like to learn more about your rodent control services. Could you tell me about your approach? Thank you!" },
    outdoor:          { keyword: "OUTDOOR",      text: "Hi! I am interested in making my outdoor space pest-free. Could you share details about the treatment options? Thanks!" },
    restaurant:       { keyword: "RESTAURANT",   text: "Hello! I am looking for pest control services for my restaurant. I would like to discuss your commercial packages. Thank you!" },
    hotel:            { keyword: "HOTEL",        text: "Hi! I am interested in pest control services for my hotel. I would love to learn about your discreet service approach. Thanks!" },
    commercial:       { keyword: "COMMERCIAL",   text: "Hello! I am looking for commercial pest control for my business. Could we discuss service options? Thank you!" },
    fumigation:       { keyword: "FUMIGATION",   text: "Hi! I would like to learn more about your fumigation services. Could you explain the process and timeline? Thank you!" },
    pre_construction: { keyword: "PRECONSTRUCT", text: "Hello! I am planning new construction and would like to learn about your pre-construction termite treatment. Thanks!" },
    preventive:       { keyword: "PREVENTIVE",   text: "Hi! I am interested in your Preventive Maintenance program. Could you share details about how it works? Thank you!" },
    protection_plan:  { keyword: "PROTECT",      text: "Hello! I am interested in your ongoing protection plans. Could you provide information about the options available? Thank you!" }
  }.freeze

  def whatsapp_link(message_type = :general)
    data = MESSAGES[message_type] || MESSAGES[:general]
    full_message = "#{data[:keyword]} - #{data[:text]}"
    "https://wa.me/#{WHATSAPP_NUMBER}?text=#{CGI.escape(full_message)}"
  end

  def whatsapp_button(text, message_type = :general, css_class = "")
    link_to whatsapp_link(message_type), target: "_blank", rel: "noopener", class: css_class do
      concat whatsapp_icon("w-5 h-5 sm:w-6 sm:h-6")
      concat content_tag(:span, text)
    end
  end

  def whatsapp_icon(css_class = "w-6 h-6")
    content_tag :svg, class: css_class, fill: "currentColor", viewBox: "0 0 24 24" do
      tag.path d: "M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"
    end
  end

  def whatsapp_message_for(message_type)
    data = MESSAGES[message_type] || MESSAGES[:general]
    "#{data[:keyword]} - #{data[:text]}"
  end
end
