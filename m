Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0AE3CF207;
	Fri,  4 Sep 2026 23:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564326; cv=none; b=GfBgDF0CQ+prgaa/5BgH7UogAy4GG1PzXlr56hjVtVmvW0YnSMB/3fzFctY9D+lVhruWPEvyub31cIVSLoYqHmRywr2/KUxs7XzwjoJIDju/KUNi6nMamk0dxherq6ESgdPqhBoGVQmGKyhD+PaESNZJOZkvHmXE4M+IUipit5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564326; c=relaxed/simple;
	bh=cy8ngxjbdJglkiDx9JMXUMAtXM0YrFwE5pxHzkk58O4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=De0DmMrog8A+N0+ixcsBq9lEc93qmNxseT0fdKacXsJSflD7BP9CqM9zc+Jv/xSiHlJAPm2EiA5BeklfvPCvUmlsHpGhpH0eRwVvXKMmAxVR/OAMPlZ2zAQ4LdN7Mz+emjtrwrols8zBW+668DGBl/GnyUFohSjcDYZkkbeTyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiLVIXxm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiLVIXxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453881F00A3D;
	Fri,  4 Sep 2026 23:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788564324;
	bh=olXaCCmLL4STsRadbiIcy5erQtuSsCpf7EdPkeUzBIk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QiLVIXxmyzG3YRudLZhUzgbYOQVN3ycrbozIdRRmqCobltaG37Lj8W2BhblGXmH0Y
	 PtvfJfN+etm78s88sLQfCQufxqIVsDjE/YRS08K80RQba2vA4vUDyrpAWofL6t2VqO
	 59utRjJ3DGNCO2l1qK7oUPoZEWppsqJg2MG5vt17MwLNN7SXNnmGfBZjKSJ22xrPhG
	 8Biv2/pYVB8VQobaYU3IEBvqRseOmUlHinAOZw8M3uyoDsIAR0jENLOJWajFHS45lx
	 AiKBtOgUi5y7hKtArQWUKfFb7acGP6hjHq62ro0Kfol8wrYx3WkYaxGrPbmL1ANu+C
	 oG4nXVS/a5qnw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/4] kconfig: prevent out-of-bounds user input for
 numeric options
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, nico@fluxnic.net, 
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, kees@kernel.org, 
 pengpeng@iscas.ac.cn, vegard.nossum@oracle.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260829171902.1510587-5-julianbraha@gmail.com>
References: <20260829171902.1510587-1-julianbraha@gmail.com>
 <20260829171902.1510587-5-julianbraha@gmail.com>
Date: Fri, 04 Sep 2026 16:25:14 -0700
Message-Id: <178856431424.3782172.2818215537125415152.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628; i=nathan@kernel.org;
 h=from:subject:message-id; bh=cy8ngxjbdJglkiDx9JMXUMAtXM0YrFwE5pxHzkk58O4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmzg+N29X/NWT6jh39l60HPKwta3BckMLde8px8NCSl5
 NO/icecOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEmG0YGZY6T5adLN81L8B7
 ceK1/N3fpt7gCij+FJrwv04mWvTKzuWMDCd//j33lHn73raS507i/essje9JeR6arDlJ4V6xf8q
 /owwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

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
...
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 2d8b0c65ce1e..6f99216ee76d 100644
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
> @@ -255,17 +254,13 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>  		return 1;
>  	}
>  
> -	errno = 0;
> -	if (sym->type == S_INT) {
> +	if (sym->type == S_INT)
>  		type_bounds = "64-bit signed integer";
> -		strtoll(sym2->name, NULL, 10);
> -	} else {
> +	else
>  		/* hex */
>  		type_bounds = "64-bit unsigned integer";
> -		strtoull(sym2->name, NULL, 16);
> -	}
>  
> -	if (errno == ERANGE) {
> +	if (!sym_string_check_bounds(sym, sym2->name)) {
>  		fprintf(stderr,
>  			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
>  			prop->filename, prop->lineno, sym_type_name(sym->type),

With this, you could inline the type bounds string like you did above:

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 6f99216ee76d..f4b5b11991b4 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -238,8 +238,6 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 				const struct property *prop)
 {
-	const char *type_bounds;
-
 	if (sym->type != S_INT && sym->type != S_HEX)
 		return 0;
 
@@ -254,17 +252,11 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 		return 1;
 	}
 
-	if (sym->type == S_INT)
-		type_bounds = "64-bit signed integer";
-	else
-		/* hex */
-		type_bounds = "64-bit unsigned integer";
-
 	if (!sym_string_check_bounds(sym, sym2->name)) {
 		fprintf(stderr,
-			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
+			"%s:%d: error: %s constant '%s' is outside the 64-bit %s integer bounds\n",
 			prop->filename, prop->lineno, sym_type_name(sym->type),
-			sym2->name, type_bounds);
+			sym2->name, sym->type == S_INT ? "signed" : "unsigned");
 
 		return 1;
 	}

> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 7e81b3676ee9..2d1c021fa395 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -5,6 +5,7 @@
>  
>  #include <sys/types.h>
>  #include <ctype.h>
> +#include <errno.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <regex.h>
> @@ -711,6 +712,21 @@ bool sym_string_valid(struct symbol *sym, const char *str)
>  	}
>  }
>  
> +bool sym_string_check_bounds(struct symbol *sym, const char *str)
> +{
> +	errno = 0;
> +
> +	if (sym->type == S_INT)
> +		strtoll(str, NULL, 10);
> +	else if (sym->type == S_HEX)
> +		strtoull(str, NULL, 16);
> +	else
> +		/* string */
> +		return true;
> +
> +	return errno != ERANGE;
> +}
> +
>  bool sym_string_within_range(struct symbol *sym, const char *str)
>  {
>  	struct property *prop;
> @@ -722,6 +738,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
>  	case S_INT:
>  		if (!sym_string_valid(sym, str))
>  			return false;
> +		if (!sym_string_check_bounds(sym, str))
> +			return false;
>  		prop = sym_get_range_prop(sym);
>  		if (!prop)
>  			return true;
> @@ -731,6 +749,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
>  	case S_HEX:
>  		if (!sym_string_valid(sym, str))
>  			return false;
> +		if (!sym_string_check_bounds(sym, str))
> +			return false;
>  		prop = sym_get_range_prop(sym);
>  		if (!prop)
>  			return true;

Sashiko has a comment that seems to be relevant here unless I
misunderstand what it is complaining about:

https://sashiko.dev/#/patchset/64934

Otherwise, I like the direction here.

-- 
Cheers,
Nathan

