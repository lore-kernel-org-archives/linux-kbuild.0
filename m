Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819326;
	b=QguIjcAb78nihOKkvZbKJrkGrnHxOMml3+cyadabupsMIavMzRywIjpP0EUH3ZL5Ydk5
	 3nZ5ZcIz+ShdBIvAbK1sX63ASvHrZWjLvK9yJR7c1qVg73PQ99NCWDiqHUHlRT+4IwnGm
	 +ttO7JBgd+Nedkf1WpgzaZCF9G4NCMraG1u3yPL1YYPYWwmDqqGPlX1SWzp4VbRdaX5RB
	 Vmkxg8QjTVUxMFq66pQf4NHq+aiThrQpsSOmBEFsY47f/6MjhPqBXJF57yWPCYclvK9P9
	 VBGMhiuCKWuAmWi5lkL/GhzarIr0cfA3RqHFehYANea7hHXIidzfO3FqP+X/1r5QfSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RyE77+5DZF/RYqJf1EmV+llValwNL1PfyoKVkBa5zLM=;
	b=i25+6U4LJf6cKtCjKEHIUtR1l97xhGXU3rt1swtdZF+E5tMpBW5UOWnHld2ldU3PMfFp
	 ut6THnn9DB0tn3oK7L8xEgczS8XBRLfMdd9lrWTf928zJV0f4JdOvCHsZMcWBCkuwfShY
	 Mv6xp1vldTKY3e4eM3TrCyx2Dhh27bs0ZTH67AK3uUesERdZH9qEDD0WMRAf+CcU/wygp
	 egcOR1CSYJlIEDTdL4ZFMCx+94nWXSQbIzNVqGQspcuwwtYQuVY4MQdrttakAYTcy8fde
	 4/By8FXTAhsHl44YgtwGlOpQb41ElRuSmhN+GF8IYD/f/jnz3hmvb1fyEtuCWCK2ajA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VK1jzXXN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB95606A31B
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VK1jzXXN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CF31F000C1;
	Wed,  4 Nov 2026 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819326;
	bh=RyE77+5DZF/RYqJf1EmV+llValwNL1PfyoKVkBa5zLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VK1jzXXN8v2b5C9YBl2iHWz3WIHiqVrZc2VvCpsudhQzUkkWjOwDDQl37g4Woqw/3
	 wou9lzyvsqlqBUR1a+yRM1I9O+YrlKNDZyJB03M20dZeAZreOAzpvNB0BCiEGEUseh
	 T4OUDnpylNPWokv8a0M2pX//scjQpioG4zIpcPuxwOOcHFfTVaEFabVj4IpmBbgURr
	 EZkKGeJYZunw95YeopcmSATY36DUPSR+ObUOZ1Vzd043RXVGSyIu11c0civyGieKcK
	 1EdOXbOYx6JTXUao9dA+X0IwR1LdRHD2xVf54pKUyur/6P0TNlBzUtP27ePUtUtqCG
	 QTw0TNgv84j0g==
Message-ID: <sashiko-outbox-197921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation: add a history of the Kconfig language
Reply-To: sashiko-reviews@lists.linux.dev
To: "Julian Braha" <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, mchehab+huawei@kernel.org, jani.nikula@intel.com, tj@kernel.org, grahamr@qti.qualcomm.com, officialnaumansabir@gmail.com, nico@fluxnic.net, linux-kbuild@vger.kernel.org
In-Reply-To: <20261103190832.3861337-1-julianbraha@gmail.com>
References: <20261103190832.3861337-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 19:08:45 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] docs: kbuild: inaccurate description of commit 03d29122738f under 2=
.6.23
- [Low] docs: kbuild: inverted choice prompt warnings for 8a36b98fd0d8 unde=
r 2.5.71
- [Low] docs: kbuild: misleading config expansion note for 4.18 source and =
mainmenu
--

commit b7aadddaf53dea66112a1e16bcdf2b1fb258d755
Author: Julian Braha <julianbraha@gmail.com>

Documentation: add a history of the Kconfig language

This commit adds Documentation/kbuild/kconfig-history.rst, documenting the
history of changes to the Kconfig language across Linux releases, categoriz=
ed
by syntax, semantics, macros, and error handling.

Link: https://github.com/zephyrproject-rtos/Kconfiglib [1]
Link: https://github.com/Mcdostone/nom-kconfig [2]
Link: https://github.com/tree-sitter-grammars/tree-sitter-kconfig [3]
Link: https://github.com/cccheng/kconfig-lsp [4]
Link: https://github.com/paulgazz/kmax [5]
Link: https://github.com/ekuiter/torte [6]
Link: https://ekuiter.github.io/torte-research/#systems [7]
Link: https://github.com/u-boot/u-boot/commit/bd3f9ee679b4d1456d0d3c261ab76=
788950e6096 [8]
Link: https://github.com/coreboot/coreboot/commit/7761237dfe0c509fa4cae255b=
20fa4b1278cbca1 [9]

> diff --git a/Documentation/kbuild/kconfig-history.rst b/Documentation/kbu=
ild/kconfig-history.rst
> new file mode 100644
> index 0000000000000..e1a4cdb141f99
> --- /dev/null
> +++ b/Documentation/kbuild/kconfig-history.rst
> @@ -0,0 +1,615 @@

[ ... ]

> +4.18
> +----
> +
> +**Semantics**:
> +
> +- remove support for evaluating config values in ``source`` and ``mainme=
nu``
> +  strings that lack parentheses. (bb222ceeb327 and 96d8e48da55a)

[Severity: Low]
Does the qualification "that lack parentheses" here imply that config option
values can still be expanded in source and mainmenu strings if parentheses
are used?

Commits bb222ceeb327 ("kconfig: remove string expansion in file_lookup()")
and 96d8e48da55a ("kconfig: remove string expansion for mainmenu after
yyparse()"), followed by commit 5b31a9746756 ("kconfig: remove
sym_expand_string_value()"), completely removed sym_expand_string_value(),
which was the mechanism that expanded Kconfig config symbol values ($FOO) in
source and mainmenu strings.

The parenthesized $(FOO) syntax introduced in 4.18 in
scripts/kconfig/preprocess.c only expands preprocessor macro variables,
functions, and environment variables in the lexer, not Kconfig config option
symbols. Should this say that support for evaluating config values in source
and mainmenu strings was removed altogether?

[ ... ]

> +2.6.23
> +------
> +
> +**Semantics**:
> +
> +- allow using ``--help--`` with menu. (03d29122738f)

[Severity: Low]
Is this description of commit 03d29122738f ("kconfig: attach help text to
menus") accurate?

In Kconfig internals, struct menu represents any menu tree entry (such as a
config, menuconfig, or choice definition). Commit 03d29122738f moved the
char *help field from struct symbol to struct menu in scripts/kconfig/expr.h
and updated the help rule in scripts/kconfig/zconf.y:

    - current_entry->sym->help =3D $2;
    + current_entry->help =3D $2;

This allowed multiple definitions of the same symbol to have distinct help
texts instead of overwriting a single per-symbol help pointer. Kconfig menu
blocks (menu ... endmenu) do not accept help attributes in the grammar, and
--help-- with two hyphens was not a valid Kconfig keyword.

[ ... ]

> +2.5.71
> +------

[ ... ]

> +**Error handling**:
> +
> +- warn when options in a choice have a ``default``. (f3b837df9e2b)
> +
> +- warn when a choice doesn't have a prompt. (8a36b98fd0d8)
> +
> +- warn when options in a choice have a prompt. (8a36b98fd0d8)

[Severity: Low]
Are these two entries for commit 8a36b98fd0d8 misstating the warnings added
in menu_finalize() in scripts/kconfig/menu.c?

In menu_finalize(), "choice value" refers to a member option inside a choice
block (SYMBOL_CHOICEVAL), whereas the choice block itself is checked
separately (and is already listed below under f9f0d1c0da3a). Commit
8a36b98fd0d8 added:

    if (!menu->prompt)
        menu_warn(menu, "choice value must have a prompt");

and:

    for (prop =3D sym->prop; prop; prop =3D prop->next) {
        ...
        if (prop->type =3D=3D P_PROMPT && prop->menu !=3D menu) {
            prop_warn(prop, "choice values currently only support a single =
prompt");
        }
    }

Should the first entry state that Kconfig warns when options in a choice do
not have a prompt, and the second entry state that Kconfig warns when optio=
ns
in a choice have multiple prompts (matching the two warnings that were later
promoted to errors in 6.10 by commits 700e7a8d05ea and 8a22f867e330)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103190832.3861=
337-1-julianbraha@gmail.com?part=3D1
