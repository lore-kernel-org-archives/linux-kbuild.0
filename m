Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56858 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727305AbfDJSSl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 14:18:41 -0400
Date: Wed, 10 Apr 2019 14:18:37 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v3 4/9] livepatch: Add klp-convert annotation helpers
Message-ID: <20190410181837.GA13083@redhat.com>
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190410155058.9437-5-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410155058.9437-5-joe.lawrence@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Wed, Apr 10, 2019 at 11:50:53AM -0400, Joe Lawrence wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> Define macros KLP_MODULE_RELOC and KLP_SYMPOS in
> include/linux/livepatch.h to improve user-friendliness of the
> livepatch annotation process.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---
>  include/linux/livepatch.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/livepatch.h b/include/linux/livepatch.h
> index 16b48e8b29a2..947cfc2d1980 100644
> --- a/include/linux/livepatch.h
> +++ b/include/linux/livepatch.h
> @@ -236,6 +236,18 @@ void *klp_shadow_get_or_alloc(void *obj, unsigned long id,
>  void klp_shadow_free(void *obj, unsigned long id, klp_shadow_dtor_t dtor);
>  void klp_shadow_free_all(unsigned long id, klp_shadow_dtor_t dtor);
>  
> +/* Used to annotate symbol relocations in livepatches */
> +#define KLP_MODULE_RELOC(obj)						\
> +	struct klp_module_reloc						\
> +	__attribute__((__section__(".klp.module_relocs." #obj)))	\
> +	__attribute__((aligned (4)))
> +
> +#define KLP_SYMPOS(symbol, pos)						\
> +	{								\
> +		.sym = &symbol,						\
> +		.sympos = pos,						\
> +	},
        ^^
nit: if we dropped the trailing array comma delimiter from KLP_SYMPOS
macro, the invocations would look more intuitively like an array.  For
example:

  KLP_MODULE_RELOC(test_klp_convert_mod) test_klp_convert_mod_relocs_a[] = {
  	KLP_SYMPOS(driver_name, 0),
  	KLP_SYMPOS(homonym_string, 2),
  	KLP_SYMPOS(get_homonym_string, 2),
  };

But I could not figure out a good regex to reference if other such
kernel preprocessor macros include or exclude the delimiter.  Are there
reasons to include it?

-- Joe
