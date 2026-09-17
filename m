Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB334F4CF7;
	Thu, 17 Sep 2026 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661644; cv=none; b=MpP//h9MTVQNHbt0NYhDaGJXBZD/kl0jR2+98QxJVqfWNQzq2LCKFCiNmcwd+6gV5awQFLWNeedkfoH3z4UXBSfH2Zqg0SE6UU76oOZRCU5E3MbaBK4vuHmKPpD4A3t4+z1vMseMzCVd5Ecn9/R7MPahmgqRoSbSeL6zsHdjh6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661644; c=relaxed/simple;
	bh=TLw0gOQVlf5AM5PWjuN9m+aLxfP0YIqSHwgmqEOMk8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KD4TmXtHBaRZast1JOI+qNOE17kgEDJJtCqHrjX8KD+d48yW23yvQfa6er/6PhoMMKXeGLFjIxAhz9nfeur1I2c+Gn/pbcb93kUIKXynHVlK3iuz2S/9ZoAHZOCTAlanyPoRLsAs0CFJwNPaKJHqFucEatATxO2YgzqRv3rCMWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=KKf7c49d; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="KKf7c49d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789661638; bh=TLw0gOQVlf5AM5PWjuN9m+aLxfP0YIqSHwgmqEOMk8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKf7c49d81uRda+sxkSxS2qJw/Oc86njPzmImjC+r4Fv4WowXEmFCsD41ysQd5Ol3
	 7uObKgf/HUMbFFejl2atcXWxOHN38haE5OrNIa7a9baEr54X2jvQBL/AMKYmVCQ90y
	 Ygt+t20R/OOu8/yvlVP7pWnljkG0LYSEXOF924VLVsRudDzcuzDOxvvNYLLELv/raA
	 NEpXUej7NU+BA4sfL9hw/Bz0kRJLvKdnk9z5PzcfVJafwlq6Na4fG94fiopX/4k7To
	 WgIN783JSuXa62yXX+hg15ZnvJJ9yu12AyHFYMHdyryM5R5Zjf77L+i0Vcq7z5h5mk
	 RorRZQZ3p1u6Q==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aac11c6-0449-7f0000032729-7f000001ed84-1
	for <multiple-recipients>; Thu, 17 Sep 2026 18:13:58 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 18:13:58 +0200 (CEST)
Date: Thu, 17 Sep 2026 18:13:57 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
	grahamr@qti.qualcomm.com, kees@kernel.org, pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 4/5] kconfig: prevent out-of-bounds user input for
 numeric options
Message-ID: <20260917-impossible-vanilla-stoat-a8e9ce@l-nschier-aarch64>
References: <20260915211508.291790-1-julianbraha@gmail.com>
 <20260915211508.291790-5-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915211508.291790-5-julianbraha@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789661638-31FD9965-492AADAC/0/0
X-purgate-type: clean
X-purgate-size: 5216
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: B760BA07D1  external: no

On Tue, Sep 15, 2026 at 10:15:07PM +0100, Julian Braha wrote:
> Currently, user input of out-of-bounds values for 'int' and 'hex' options
> is possible, leading to later silent failures in Kconfig if that value is
> used in a comparison, or a warning by GCC or error by Clang if used in the
> C code.
> 
> Let's factor out the out-of-bounds check on constants, so that it can be
> reused for checking user input.
> 
> The frontend will now reject an attempted user input of an out-of-bounds
> numeric value, similarly to how a value outside the active 'range' already
> does.
> 
> For migration of existing configurations, a .config file with an
> out-of-bounds numeric value will be allowed for now, but will warn the
> user when read in by confdata.c
> 
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/confdata.c                    |  6 +++++
>  scripts/kconfig/lkc_proto.h                   |  1 +
>  scripts/kconfig/menu.c                        | 19 +++-----------
>  scripts/kconfig/symbol.c                      | 20 +++++++++++++++
>  .../tests/err_num_bounds/expected_stderr      | 20 +++++++--------
>  scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++++++++++++++
>  .../kconfig/tests/warn_num_bounds/__init__.py | 25 +++++++++++++++++++
>  scripts/kconfig/tests/warn_num_bounds/config  |  7 ++++++
>  .../tests/warn_num_bounds/expected_config     | 11 ++++++++
>  .../warn_num_bounds/expected_config_stderr    |  3 +++
>  .../warn_num_bounds/expected_frontend_config  | 11 ++++++++
>  .../warn_num_bounds/expected_frontend_stderr  |  0
>  12 files changed, 121 insertions(+), 26 deletions(-)
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/Kconfig
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/__init__.py
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/config
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
>  create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 4234a51d16fd..2227d89d6328 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -354,6 +354,12 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>  	case S_INT:
>  	case S_HEX:
>  		if (sym_string_valid(sym, p)) {
> +			if (def != S_DEF_AUTO &&
> +			    !sym_string_check_bounds(sym, p))
> +				/* hex uses 64-bit unsigned integer */
> +				conf_warning("value '%s' for %s is outside the 64-bit %s integer bounds",
> +					     p, sym->name,
> +					     sym->type == S_INT ? "signed" : "unsigned");
>  			sym->def[def].val = xstrdup(p);
>  			sym->flags |= def_flags;
>  		} else {
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 8914b4e8f2a8..8b436c87ba4a 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -31,6 +31,7 @@ bool sym_set_tristate_value(struct symbol *sym,tristate tri);
>  void choice_set_value(struct menu *choice, struct symbol *sym);
>  tristate sym_toggle_tristate_value(struct symbol *sym);
>  bool sym_string_valid(struct symbol *sym, const char *newval);
> +bool sym_string_check_bounds(struct symbol *sym, const char *str);
>  bool sym_string_within_range(struct symbol *sym, const char *str);
>  bool sym_set_string_value(struct symbol *sym, const char *newval);
>  bool sym_is_changeable(const struct symbol *sym);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 2d8b0c65ce1e..6b9ef738ee71 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <ctype.h>
> -#include <errno.h>
>  #include <stdarg.h>
>  #include <stdlib.h>
>  #include <string.h>
> @@ -239,8 +238,6 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
>  static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>  				const struct property *prop)
>  {
> -	const char *type_bounds;
> -
>  	if (sym->type != S_INT && sym->type != S_HEX)
>  		return 0;
>  
> @@ -255,21 +252,11 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>  		return 1;
>  	}
>  
> -	errno = 0;
> -	if (sym->type == S_INT) {
> -		type_bounds = "64-bit signed integer";
> -		strtoll(sym2->name, NULL, 10);
> -	} else {
> -		/* hex */
> -		type_bounds = "64-bit unsigned integer";
> -		strtoull(sym2->name, NULL, 16);
> -	}
> -
> -	if (errno == ERANGE) {
> +	if (!sym_string_check_bounds(sym, sym2->name)) {
>  		fprintf(stderr,
> -			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
> +			"%s:%d: error: %s constant '%s' is outside the 64-bit %s bounds\n",

tests/err_num_bounds/expected_stderr wouldn't need to be updated here 
with 's/bounds/integer bounds/'; but AFAIC leave it as it is right now.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
