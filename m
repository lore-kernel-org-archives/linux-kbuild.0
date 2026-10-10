Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5D2E03EA;
	Sat, 10 Oct 2026 20:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791665866; cv=none; b=jlJadIpbnZKU1x0tYbOqO1saFFG0IjMg1YRqfEeCoW/Yc0ufiK3XaxiDUvhhnFP7qCVM3p7PgYck0xWdfQjh3mjJ6w5YEqQz0vDyDb38IiQSShbX5AgeDBjJ5nCngzgRYVOe21me3KVyTxbu8QEiMF0CqGxvc1GOxBRjmyDVFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791665866; c=relaxed/simple;
	bh=G0vp48e779nuh57IGbn1SLkyUvc9BPz/5Zj+FYlzcEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SS2XE2q+aO+9Q+TIGWqKUdH4k4Lwj+DOOwQw2Gmw9KUE5tlYx/alxDwYjL/42BNOstlS1ISHL4FciwjCfqeGJTK7XDY6zzfzNrb5wKahiLf9PHF8a0Pj76gqG5nzpxzNwH6ZdF0ErazIoJzwmth0wiNXzQWmb+R2u6cYW1BePTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YEFbbcwZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YEFbbcwZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=klj1jCvG2Axc6ce2mXx7Fc9cBFIR1WVENH+HxPX3PT0=; b=YEFbbcwZglKnXhSGPgHnjCEnVI
	gfKNlw541UP+PDboJjiAdeE+Uho1FyQWiVZN9mBBY+mBxyiDkiTyXheeyfMEejHxFmyZDmdtI2l10
	uMFxr6qJjSJES4PStx4WNlSHifGe+hLhVUwWDTxken2WZ2JI6OHzUmzYpRfMMJHzOWE5b8da1hvzu
	DscosaqXd44tSftnOMs6m8o2O6m02M8v4Qe8s0JliKdF5SPgk2QKS6NkKMg9059SraK/tOn3zTkH/
	vMfYtywyADI5QuFS9jwgWmJsmPaiuJ0V6dVx/vrUpaQQLYFgMaf+YPEzV1wARFjBT9xAjPZNakOa1
	y2kYWXUg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFe8R-00000008RUF-3ZEY;
	Sat, 10 Oct 2026 20:57:39 +0000
Message-ID: <bd8e9af9-4e51-43d3-b62b-bd2fcc23e050@infradead.org>
Date: Sat, 10 Oct 2026 13:57:38 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: show number of search results in search UI
To: Zuo An <zuoan.penguin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <aspVmnam3QL_DRYV@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aspVmnam3QL_DRYV@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/26 8:11 AM, Zuo An wrote:
> When searching for symbols in nconfig/menuconfig, the search
> results popup will now display a count of the results
> in the title bar, e.g. "Search Results (42)".
> 
> This helps the user to gauge the number of matches quickly and
> refine their search if needed, rather than having to scroll down
> by an indefinite amount (especially for nconfig's UI which lacks
> a display of the scrolling progress).
> 
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Looks good. Thanks.

> ---
>  scripts/kconfig/lkc_proto.h |  2 +-
>  scripts/kconfig/mconf.c     | 10 ++++++++--
>  scripts/kconfig/nconf.c     | 10 ++++++++--
>  scripts/kconfig/qconf.cc    |  2 +-
>  scripts/kconfig/symbol.c    |  4 +++-
>  5 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 8914b4e8f2a8..224acc142769 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -21,7 +21,7 @@ bool conf_errors(void);
>  struct symbol * sym_lookup(const char *name, int flags);
>  struct symbol * sym_find(const char *name);
>  void print_symbol_for_listconfig(struct symbol *sym);
> -struct symbol ** sym_re_search(const char *pattern);
> +struct symbol ** sym_re_search(const char *pattern, int *sym_cnt);
>  const char * sym_type_name(enum symbol_type type);
>  void sym_calc_value(struct symbol *sym);
>  bool sym_dep_errors(void);
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index b8b7bba84a65..f37c3f8e1f4d 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -384,8 +384,10 @@ static void show_help(struct menu *menu)
>  static void search_conf(void)
>  {
>  	struct symbol **sym_arr;
> +	int sym_cnt;
>  	struct gstr res;
>  	struct gstr title;
> +	struct gstr res_title;
>  	char *dialog_input;
>  	int dres, vscroll = 0, hscroll = 0;
>  	bool again;
> @@ -422,7 +424,7 @@ static void search_conf(void)
>  	stpart.text = str_get(&sttext);
>  	list_add_tail(&stpart.entries, &trail);
>  
> -	sym_arr = sym_re_search(dialog_input);
> +	sym_arr = sym_re_search(dialog_input, &sym_cnt);
>  	do {
>  		LIST_HEAD(head);
>  		struct search_data data = {
> @@ -433,9 +435,13 @@ static void search_conf(void)
>  		jump_key_char = 0;
>  		res = get_relations_str(sym_arr, &head);
>  		set_subtitle();
> -		dres = show_textbox_ext("Search Results", str_get(&res), 0, 0,
> +
> +		res_title = str_new();
> +		str_printf(&res_title, "Search Results (%d)", sym_cnt);
> +		dres = show_textbox_ext(str_get(&res_title), str_get(&res), 0, 0,
>  					&vscroll, &hscroll,
>  					handle_search_keys, &data);
> +
>  		again = false;
>  		if (dres >= '1' && dres <= '9') {
>  			assert(data.target != NULL);
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 521700ed7152..e3b25940b931 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -700,8 +700,10 @@ static int do_exit(void)
>  static void search_conf(void)
>  {
>  	struct symbol **sym_arr;
> +	int sym_cnt;
>  	struct gstr res;
>  	struct gstr title;
> +	struct gstr res_title;
>  	char *dialog_input;
>  	int dres, vscroll = 0, hscroll = 0;
>  	bool again;
> @@ -732,7 +734,7 @@ static void search_conf(void)
>  	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
>  		dialog_input += strlen(CONFIG_);
>  
> -	sym_arr = sym_re_search(dialog_input);
> +	sym_arr = sym_re_search(dialog_input, &sym_cnt);
>  
>  	do {
>  		LIST_HEAD(head);
> @@ -742,10 +744,14 @@ static void search_conf(void)
>  		};
>  		jump_key_char = 0;
>  		res = get_relations_str(sym_arr, &head);
> +
> +		res_title = str_new();
> +		str_printf(&res_title, "Search Results (%d)", sym_cnt);
>  		dres = show_scroll_win_ext(main_window,
> -				"Search Results", str_get(&res),
> +				str_get(&res_title), str_get(&res),
>  				&vscroll, &hscroll,
>  				handle_search_keys, &data);
> +
>  		again = false;
>  		if (dres >= '1' && dres <= '9') {
>  			assert(data.target != NULL);
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index b02ead7a3f98..8f51dc55226d 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1245,7 +1245,7 @@ void ConfigSearchWindow::search(void)
>  	list->clear();
>  	info->clear();
>  
> -	result = sym_re_search(editField->text().toLatin1());
> +	result = sym_re_search(editField->text().toLatin1(), nullptr);
>  	if (!result)
>  		return;
>  	for (p = result; *p; p++) {
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 7e81b3676ee9..31f927bd563a 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1020,7 +1020,7 @@ static int sym_rel_comp(const void *sym1, const void *sym2)
>  	return strcmp(s1->sym->name, s2->sym->name);
>  }
>  
> -struct symbol **sym_re_search(const char *pattern)
> +struct symbol **sym_re_search(const char *pattern, int *sym_cnt)
>  {
>  	struct symbol *sym, **sym_arr = NULL;
>  	struct sym_match *sym_match_arr = NULL;
> @@ -1065,6 +1065,8 @@ struct symbol **sym_re_search(const char *pattern)
>  			sym_arr[i] = sym_match_arr[i].sym;
>  		sym_arr[cnt] = NULL;
>  	}
> +	if (sym_cnt)
> +		*sym_cnt = cnt;
>  sym_re_search_free:
>  	/* sym_match_arr can be NULL if no match, but free(NULL) is OK */
>  	free(sym_match_arr);

-- 
~Randy
