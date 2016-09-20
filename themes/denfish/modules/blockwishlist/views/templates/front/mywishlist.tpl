<div class="my-account">
<div id="mywishlist">
	<div class="clearfix">
		{capture name=path}
			<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
				{l s='Личный кабинет' mod='blockwishlist'}
			</a>
			<span class="navigation-pipe">
				{$navigationPipe}
			</span>
			<span class="navigation_page">
				{l s='Избранное' mod='blockwishlist'}
			</span>
		{/capture}
		{include file="$tpl_dir./breadcrumb-cart.tpl"}
	    {include file="$tpl_dir./modules/blocksearch/blocksearch-top.tpl"}
    </div>
	<h1 class="page-heading">{l s='Избранное' mod='blockwishlist'}</h1>

	{include file="$tpl_dir./errors.tpl"}

	{if $id_customer|intval neq 0}
		<form method="post" class="std my_box" id="form_wishlist">
			<fieldset>
				<h3 class="page-subheading">{l s='Новый список избранного' mod='blockwishlist'}</h3>
				<div class="form-group">
					<input type="hidden" name="token" value="{$token|escape:'html':'UTF-8'}" />
					<input type="text" id="name" name="name" class="inputTxt form-control" value="{if isset($smarty.post.name) and $errors|@count > 0}{$smarty.post.name|escape:'html':'UTF-8'}{/if}" />
					<label class="align_right" for="name">
						{l s='Имя' mod='blockwishlist'}
					</label>
				</div>
				<p class="submit">
                    <button 
                    id="submitWishlist" 
                    class="btn btn-default button button-medium save_info" 
                    type="submit" 
                    name="submitWishlist">
                    	<span>{l s='Сохранить'}<i class="fa fa-floppy-o fa-2x"></i></span>
                    </button>
				</p>
			</fieldset>
		</form>
		{if $wishlists}
			<div id="block-history" class="block-center">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="first_item">{l s='Name' mod='blockwishlist'}</th>
							<th class="item mywishlist_first">{l s='Qty' mod='blockwishlist'}</th>
							<th class="item mywishlist_first">{l s='Viewed' mod='blockwishlist'}</th>
							<th class="item mywishlist_second">{l s='Created' mod='blockwishlist'}</th>
							<th class="item mywishlist_second">{l s='Direct Link' mod='blockwishlist'}</th>
							<th class="last_item mywishlist_first">{l s='Delete' mod='blockwishlist'}</th>
						</tr>
					</thead>
					<tbody>
						{section name=i loop=$wishlists}
							<tr id="wishlist_{$wishlists[i].id_wishlist|intval}">
								<td style="width:200px;">
									<a href="javascript:;" onclick="javascript:WishlistManage('block-order-detail', '{$wishlists[i].id_wishlist|intval}');">
										{$wishlists[i].name|truncate:30:'...'|escape:'html':'UTF-8'}
									</a>
								</td>
								<td class="bold align_center">
									{assign var=n value=0}
									{foreach from=$nbProducts item=nb name=i}
										{if $nb.id_wishlist eq $wishlists[i].id_wishlist}
											{assign var=n value=$nb.nbProducts|intval}
										{/if}
									{/foreach}
									{if $n}
										{$n|intval}
									{else}
										0
									{/if}
								</td>
								<td>{$wishlists[i].counter|intval}</td>
								<td>{$wishlists[i].date_add|date_format:"%Y-%m-%d"}</td>
								<td>
									<a  href="javascript:;"  onclick="javascript:WishlistManage('block-order-detail', '{$wishlists[i].id_wishlist|intval}');">
										{l s='View' mod='blockwishlist'}
									</a>
								</td>
								<td class="wishlist_delete">
									<a 
									class="icon" 
									href="javascript:;" 
									onclick="return (WishlistDelete('wishlist_{$wishlists[i].id_wishlist|intval}', '{$wishlists[i].id_wishlist|intval}', '{l s='Do you really want to delete this wishlist ?' mod='blockwishlist' js=1}'));">
										<i class="icon-remove"></i>
									</a>
								</td>
							</tr>
						{/section}
					</tbody>
				</table>
			</div>
			<div id="block-order-detail">&nbsp;</div>
		{/if}
	{/if}
	<ul class="footer_links clearfix">
		<li>
			<a class="btn btn-default button button-small" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Личный кабинет' mod='blockwishlist'}
				</span>
			</a>
		</li>
		<li>
			<a class="btn btn-default button button-small" href="{$base_dir|escape:'html':'UTF-8'}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Главная' mod='blockwishlist'}
				</span>
			</a>
		</li>
	</ul>
</div>
	</div>