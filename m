Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34860 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752913Ab3KHJuF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Nov 2013 04:50:05 -0500
Message-ID: <527CB3C9.1080205@suse.cz>
Date: Fri, 08 Nov 2013 10:50:01 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH]kconfig:qconf: Add an option to the "find" dialog for
 search in the description.
References: <526C1E31.2040604@gmail.com>
In-Reply-To: <526C1E31.2040604@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "v1kt0p.rus@gmail.com" <v1kt0p.rus@gmail.com>
Cc: linux-kbuild@vger.kernel.org, james.hogan@imgtec.com, ralf@linux-mips.org, tkhai@yandex.ru, "Yann E. MORIN" <yann.morin.1998@free.fr>

On 26.10.2013 21:55, v1kt0p.rus@gmail.com wrote:
> Adding the ability to search in description.
> 
> Signed-off-by: Victor Danchenko <v1kt0p.rus@gmail.com>

Added Yann to CC.

Michal
> ---
>   scripts/kconfig/lkc_proto.h |  3 ++-
>   scripts/kconfig/mconf.c     |  2 +-
>   scripts/kconfig/nconf.c     |  2 +-
>   scripts/kconfig/qconf.cc    | 13 ++++++++++++-
>   scripts/kconfig/qconf.h     |  3 +++
>   scripts/kconfig/symbol.c    | 41 ++++++++++++++++++++++++++++++++++++++---
>   6 files changed, 57 insertions(+), 7 deletions(-)
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index ecdb965..5379647 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -35,7 +35,8 @@ P(sym_lookup,struct symbol *,(const char *name, int flags));
>   P(sym_find,struct symbol *,(const char *name));
>   P(sym_expand_string_value,const char *,(const char *in));
>   P(sym_escape_string_value, const char *,(const char *in));
> -P(sym_re_search,struct symbol **,(const char *pattern));
> +P(sym_re_search, struct symbol **, (const char *pattern,
> +            const bool in_description));
>   P(sym_type_name,const char *,(enum symbol_type type));
>   P(sym_calc_value,void,(struct symbol *sym));
>   P(sym_get_type,enum symbol_type,(struct symbol *sym));
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 2c39631..e7aeb5b 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -430,7 +430,7 @@ again:
>       stpart.text = str_get(&sttext);
>       list_add_tail(&stpart.entries, &trail);
> 
> -    sym_arr = sym_re_search(dialog_input);
> +    sym_arr = sym_re_search(dialog_input, false);
>       do {
>           LIST_HEAD(head);
>           struct menu *targets[JUMP_NB];
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 4fbecd2..bac5054 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -720,7 +720,7 @@ again:
>       if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
>           dialog_input += strlen(CONFIG_);
> 
> -    sym_arr = sym_re_search(dialog_input);
> +    sym_arr = sym_re_search(dialog_input, false);
>       res = get_relations_str(sym_arr, NULL);
>       free(sym_arr);
>       show_scroll_win(main_window,
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 1500c38..3df276a 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1197,6 +1197,9 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
>       layout2->addWidget(searchButton);
>       layout1->addLayout(layout2);
> 
> +    searchInDescription = new QCheckBox(_("Search in all texts."), this);
> +    layout1->addWidget(searchInDescription);
> +
>       split = new QSplitter(this);
>       split->setOrientation(Qt::Vertical);
>       list = new ConfigView(split, name);
> @@ -1253,7 +1256,15 @@ void ConfigSearchWindow::search(void)
>       list->list->clear();
>       info->clear();
> 
> -    result = sym_re_search(editField->text().latin1());
> +    bool in_description = false;
> +#if QT_VERSION >= 0x040000
> +    if (searchInDescription->checkState() == Qt::Checked) {
> +#else
> +    if (searchInDescription->isChecked() == TRUE) {
> +#endif
> +        in_description = true;
> +    }
> +    result = sym_re_search(editField->text().latin1(), in_description);
>       if (!result)
>           return;
>       for (p = result; *p; p++) {
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index 3715b3e..70f283e 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -5,8 +5,10 @@
> 
>   #if QT_VERSION < 0x040000
>   #include <qlistview.h>
> +#include <qcheckbox.h>
>   #else
>   #include <q3listview.h>
> +#include <QCheckBox>
>   #endif
>   #include <qsettings.h>
> 
> @@ -294,6 +296,7 @@ protected:
>       QSplitter* split;
>       ConfigView* list;
>       ConfigInfoView* info;
> +    QCheckBox *searchInDescription;
> 
>       struct symbol **result;
>   };
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index c9a6775..baa6ac3 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -990,7 +990,7 @@ static int sym_rel_comp(const void *sym1, const void *sym2)
>       return strcmp(s1->sym->name, s2->sym->name);
>   }
> 
> -struct symbol **sym_re_search(const char *pattern)
> +struct symbol **sym_re_search(const char *pattern, const bool in_description)
>   {
>       struct symbol *sym, **sym_arr = NULL;
>       struct sym_match *sym_match_arr = NULL;
> @@ -1008,8 +1008,43 @@ struct symbol **sym_re_search(const char *pattern)
>       for_all_symbols(i, sym) {
>           if (sym->flags & SYMBOL_CONST || !sym->name)
>               continue;
> -        if (regexec(&re, sym->name, 1, match, 0))
> -            continue;
> +        if (in_description) {
> +            struct property *prop;
> +            size_t length = 1;
> +            if (sym->name)
> +                length += strlen(sym->name);
> +            for_all_prompts(sym, prop) {
> +                if (prop->text)
> +                    length += strlen(prop->text) + 1;
> +                if (prop->menu && prop->menu->help)
> +                    length += strlen(prop->menu->help) + 1;
> +            }
> +            char *all_text = 0;
> +            all_text = malloc(length);
> +            if (!all_text)
> +                goto sym_re_search_free;
> +            *all_text = 0;
> +            if (sym->name)
> +                strcat(all_text, sym->name);
> +            for_all_prompts(sym, prop) {
> +                if (prop->text) {
> +                    strcat(all_text, "\n");
> +                    strcat(all_text, prop->text);
> +                }
> +                if (prop->menu && prop->menu->help) {
> +                    strcat(all_text, "\n");
> +                    strcat(all_text, prop->menu->help);
> +                }
> +            }
> +            if (regexec(&re, all_text, 1, match, 0)) {
> +                free(all_text);
> +                continue;
> +            }
> +            free(all_text);
> +        } else {
> +            if (regexec(&re, sym->name, 1, match, 0))
> +                continue;
> +        }
>           if (cnt >= size) {
>               void *tmp;
>               size += 16;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

