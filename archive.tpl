


{{extends file="layout.tpl"}}

{{block content}}


  <h3 class="header full_height blue">{{ if $gimme->language->english_name == "Georgian" }}არქივი{{else}}Archive{{/if}}</h3>


  {{ list_issues order="bynumber desc" constraints="number greater 1" columns="2"}}
                      {{if $gimme->current_list->column==1}}
                      <ul class="entries_list small space_top_13 row grey_image_border_bottom">
                        {{/if}}
                          <li class="span4">
                             
                                <div class="content">
                                  <h5 class="title"><a href="{{ uri options="template issue.tpl" }}">{{ $gimme->issue->name }}</a></h5>
                                    <p><time datetime="{{ $gimme->issue->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->issue->publish_date|camp_date_format:"%d %M %Y" }}</time> 
                             </p>
                                </div>
                             
                            </li>
                      {{if $gimme->current_list->column==2}} 
                        </ul>
                      {{/if}}
                      
                       {{ /list_issues }}   




 


 



      



{{/block}}

