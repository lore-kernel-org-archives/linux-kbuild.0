Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC1D4A64FD;
	Wed,  7 Oct 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384484; cv=none; b=N9ulwFXRyuKRIV3riL0OaqutYKFKP13aV5NbOrHjPLd4KXRSW3Rn+1CgT812QIA6JARqReCQKoHLrKsE7N8SindELs+yPsHpXWkkoWrZ4KHXKT7E2Nd5S/7JvjZgmp1ys0Hd/SWAL5siL/XLtGmZVNUPvNe81K6GKVmNq0g9o1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384484; c=relaxed/simple;
	bh=4YeYZbFxnnTq8Zxe0UN52ijygm+ZPz4pkrUEfc8nidw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=MffyIlp37glr3MgoxJM8kG7Z1dkNGjFdwMKVXsshnsGnyPOFngKBGJbibABAH5V0EWMDlENs36+cp7X9YlBLXbzruhSjbgA/CfzI3b4fd6buQjT/+2hfdbQF3XHBCjx+Fw9SIOKy+F14vzkKnoGB1ebt+2bQ9zbvw6cEcdq7jlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAn56DuT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAn56DuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E2F1F00893;
	Wed,  7 Oct 2026 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384477;
	bh=3iuGpjmarbI9GgEn3JVwAh/zaf69Y3XK1GSiAdhyTbc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RAn56DuTwSfTSEd6JBSKuGIHoKD4fed+0X1G9tDZoYs/PFo7YeGmGN/8sEfsUZ8cA
	 RD/rSii8WqxQWWVzQlSlYlSV5Q4EQmD2VVY/4l/masTl97iTbb71t+ztBUDSk5NXYI
	 oh5ah7JBg04uHITicJembFyaORhpCHf20HxHet6nKJDP7yOO5qmIPNDXnxx6EjvKRM
	 p21m9hTJAyvryqdK2iSq6vtvXbhsOrc6HqrWvz+8GvL1oOb/iUMEZ5mMDMgEWDP4mM
	 mWRfWrGT3Dq0n+v6ILB0Iz10P58EJ4RdR7jg1MsYHBSDryFxLjOhet+4jYK3QxoEfK
	 nEL4Jqoec540w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] kbuild: record real-prereqs in .cmd files
From: Nicolas Schier <nsc@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, 
 maximilian.huber@tngtech.com
In-Reply-To: <20260828085441.156386-2-luis.augenstein@tngtech.com>
References: <20260828085441.156386-1-luis.augenstein@tngtech.com>
 <20260828085441.156386-2-luis.augenstein@tngtech.com>
Date: Wed, 07 Oct 2026 16:46:02 +0200
Message-Id: <179138436214.145576.15291381959921627967.b4-review@b4>
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=4YeYZbFxnnTq8Zxe0UN52ijygm+ZPz4pkrUEfc8nidw=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqxlsszJE4nTrWC1aOAOM3/4UpBiEKPlq+LQ0IM
 LA2zphrKQGJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCasZbLAAKCRAHUgpwFiYS
 aRyHD/9edsSQG4OslPZv1VmW51qNJRNW7DRTO7PA2yg39cGvccZodCINJHX0Iq7G9OTZjZr1XKu
 1Ze0u/u220wJmBNcKeRwfz8aGHcysSoNR7USG/lRr+xDAod36xjaCgTfvUsFruljM5ixdBf4szw
 o4pYb7QKUp88bS8ftu0kVEgWaSApwXRh8y/Vfy1yEyjO6sUp8BFWCAbwcEY3O+ybauecmG1wvoH
 VlsEFZO7Byl+9NLeMWB9EYvWPSzIzVJJBqX+2u/jvIeTqDDIknKQ/cqleO38WgyG3rKjmgfzBev
 s0+fNxv/MhYn1wEvcW23ayrwB9sruhwduU8VsuT4IOHPr/tAgwAUVCbrVXdLra5ret61yJFqvCw
 qGycLvVaG2I2pb78Ei5UqLdS6E0YuZ7+hlSuasyHyFRlhSJxjj2IW2b8L6RU4fm3jQ9aN2L61+C
 P0932hqjYV770GYKUaBvuDmgc3gFMCW0Atl7cCVF6DK2vVaC0o2BMUp78qnQXS3anNuY3/pXWui
 Bd8QVAKpeCfjtORGgkPnTfUrg4fND2KydCv/bIW+NSd9AOl4ubRkvcTckCfPXXsX1vUcMaXCcZl
 QNIFsE17QfomntFPzuva1oiZnqYcvpFdSIUPM5vMuiWi6jtgshRkOqS1Nqmc9b02f0bGVqdHTNc
 lSa07MfXuzyOTsQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

First of all, sorry for the very long delay.  I finally had a first view
and tests on the patch, but I haven't tested in depth yet.  Some
first-round feedback:

> Record $(real-prereqs), the non-phony prerequisites of the target, in a
> new metadata field:
> 
>     make_prereqs_<target> := <prerequisites>
> 
> Write the field from both cmd_and_savecmd and cmd_and_fixdep.
>
> Update scripts/make_fit.py to read only savedcmd_* instead of parsing the
> complete .cmd file.

This sounds like a good thing; but I can't find that in the diff.

While at it, you changed the handling of deps in fixdep -- I think in a
good way.  I'd like to see this in three steps:

  * Limit make_fit's parsing to savedcmd_
  * Update fixdeps handling of 'deps_'
  * Add 'make_prereqs_<target>' support to Kbuild.include and fixdep

> Ignore make_prereqs_* in KernelSbom.

I know this makes sense to fit the every-interface-needs-a-user rule,
but I don't like to add a dummy consumer here to match that rule.

Why do you defer the actual implementation in the SBOM scripts?  From my
point of view, the introduction of 'make_prereqs_<target>' looks good
and I don't see a reason for waiting with the corresponding SBOM
implementation.

> 
> Link: https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com
> Assisted-by: Cursor:GPT-5.6 Sol

The new rule wants:

    Assisted-by: LLM 

instead, cp. https://git.kernel.org/stable/c/816d9992d9ed434ec52cfbd63080d518e535a41b

> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
> ---
>  scripts/Kbuild.include                  |   9 +-
>  scripts/basic/fixdep.c                  | 159 ++++++++++++++++++++----
>  scripts/make_fit.py                     |   2 +-
>  scripts/sbom/sbom/cmd_graph/cmd_file.py |   4 +
>  4 files changed, 148 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e24..6daa244ba0ef 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -181,6 +181,9 @@ endif
>  # (needed for the shell)
>  make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1)))))
>  
> +# prerequisites to record in .cmd files, excluding those covered in deps_*
> +cmd-prereqs = $(call escsq,$(filter-out $(deps_$@), $(real-prereqs)))
> +
>  # Find any prerequisites that are newer than target or that do not exist.
>  # PHONY targets skipped in both cases.
>  # If there is no prerequisite other than phony targets, $(newer-prereqs) becomes
> @@ -198,14 +201,16 @@ if_changed = $(if $(if-changed-cond),$(cmd_and_savecmd),@:)
>  
>  cmd_and_savecmd =                                                            \
>  	$(cmd);                                                              \
> -	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd
> +	printf '%s\n\n%s\n' 'savedcmd_$@ := $(make-cmd)'                    \
> +		'make_prereqs_$@ := $(cmd-prereqs)' > $(dot-target).cmd

Just bike-shedding:  I think the main points are tiny bit easier to read
this way:

 cmd_and_savecmd =							\
 	$(cmd);								\
	printf '%s\n'							\
		'savedcmd_$@ := $(make-cmd)' ''				\
		'make_prereqs_$@ := $(cmd-prereqs)' > $(dot-target).cmd

Take it or just keep your version, as you like.




All in all, this looks good to me. Thanks

-- 
Nicolas

