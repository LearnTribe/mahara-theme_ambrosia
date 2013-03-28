    <tr class="{cycle values='r0,r1'}">
      <td class="cv"><a href="{$item.url}">{$item.name|str_shorten_text:50:true}</a></td>
      <td class="al">
      {if $item.access}<div>{$item.access}</div>{/if}
      {if $item.accessgroups}
        {foreach from=$item.accessgroups item=accessgroup name=ags}{strip}
          {if $accessgroup.accesstype == 'loggedin'}
            {str tag="loggedin" section="view"}
          {elseif $accessgroup.accesstype == 'public'}
            {str tag="public" section="view"}
          {elseif $accessgroup.accesstype == 'friends'}
            <a href="{$WWWROOT}user/myfriends.php" id="link-myfriends">{str tag="friends" section="view"}</a>
          {elseif $accessgroup.accesstype == 'group'}
            <a href="{$accessgroup.groupurl}">{$accessgroup.name}</a>{if $accessgroup.role} ({$accessgroup.roledisplay}){/if}
          {elseif $accessgroup.accesstype == 'institution'}
            <a href="{$WWWROOT}account/institutions.php">{$accessgroup.id|institution_display_name}</a>
          {elseif $accessgroup.accesstype == 'user'}
            <a href="{profile_url($accessgroup.id)}">{$accessgroup.id|display_name}</a>
          {/if}
          {if $accessgroup.startdate}
            {if $accessgroup.stopdate}
              <span class="date"> {$accessgroup.startdate|strtotime|format_date:'strfdaymonthyearshort'}&rarr;{$accessgroup.stopdate|strtotime|format_date:'strfdaymonthyearshort'}</span>
            {else}
              <span class="date"> {str tag=after} {$accessgroup.startdate|strtotime|format_date:'strfdaymonthyearshort'}</span>
            {/if}
          {elseif $accessgroup.stopdate}
            <span class="date"> {str tag=before} {$accessgroup.stopdate|strtotime|format_date:'strfdaymonthyearshort'}</span>
          {/if}{if !$dwoo.foreach.ags.last}, {/if}
        {/strip}{/foreach}
        {if $view.template}<div>{str tag=thisviewmaybecopied section=view}</div>{/if}
      {/if}
      </td>
      <td class="al-edit">
        <a href="{$WWWROOT}view/access.php?id={$item.viewid}" title="{str tag=editaccess section=view}"><img src="{theme_url filename='images/edit_access.gif'}" alt="{str tag=editaccess}"></a>
      </td>
      <td class="secreturls">
        {$item.secreturls} <a title="{str tag=editsecreturlaccess section=view}" href="{$WWWROOT}view/urls.php?id={$item.viewid}"><img src="{theme_url filename='images/edit.gif'}" alt="{str tag=edit}"></a>
      </td>
    </tr>
