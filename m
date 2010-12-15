Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:53913 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065Ab0LOFcr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 00:32:47 -0500
Received: by iwn9 with SMTP id 9so1626941iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 21:32:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201012150034.01356.yann.morin.1998@anciens.enib.fr>
References: <201012150034.01356.yann.morin.1998@anciens.enib.fr>
Date: Wed, 15 Dec 2010 00:32:46 -0500
Message-ID: <AANLkTinAVtq6W=tKmf5ezkYDKyUH_udS632995HZF_Ly@mail.gmail.com>
Subject: Re: RFC: multi-sourced file, multiple choice 'instanciations'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Tue, Dec 14, 2010 at 6:34 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Hello All!
>
> For a project I'm maintaining, crosstool-NG [0], I'm using Kconfig to setup
> the configuration.
>
> In this context, I have the need for options that are common to multiple,
> exclusive components (each a boolean in a choice). Each component also
> has its own set of options. What makes it complex is that, given three
> components, only two have the common options, while the third will not.
> See [1] for an example of such a (limited, yet representative) setup.
>
> But currently, mconf refuses to include the same files more than once:
>  component-2.in:12: file 'common.in' is already sourced from 'component-1.in'
>
> This is trivial to 'fix', when the multi-sourced file does not have choices
> in it, that is only bools, strings, ints... Just yank the 6-or-so lines that
> are responsible for the check.
>
> But now, if the multi-included file has a choice in it, as in [2], then
> mconf whines again
>  common.in:9:warning: choice value used outside its choice group
>  common.in:13:warning: choice value used outside its choice group
>
> Those are just warnings, easy to yank, but what are the real implications?
> In my special case, the choice is only to be displayed _once_, as the three
> components are mutually exclusive.
>
> But, it refuses to show the choice from the second (and subsequent) sourcings.
> Of course, only one component is selected at a time (manually guaranteed,
> or even enforced by a more complex structure in config.in).
>
> For the component-1, we get the expected display (common does not depend on
> C1_A, here):
>  --- comp-1
>  [ ]   C1_A (NEW)
>        *** common ***
>        Get one free (All A)  --->
>
> For component-2, the choice is missing (common depends on C2_A, here, but
> it does not matter if it does not):
>  --- comp-2
>  [*]   C2_A
>          *** common ***
>          Get one free
>
Looking at the conditional and the commit log which introduced the
behavior should have given you the answer. You need to assign each
choice group the same name. The warning will go away and both will
display correctly.

This is not documented.

 - Arnaud

> [1] Example of multi-sourced file:
>    ---8<---
>    $ cat config.in
>    |comment "Select only one amongst those three:"
>    |source component-1.in
>    |source component-2.in
>    |source component-3.in
>
>    $ cat component-1.in
>    |menuconfig COMP_1
>    |    bool
>    |    prompt "comp-1"
>    |
>    |if COMP_1
>    |
>    |config C1_A
>    |    bool
>    |    prompt "C1_A"
>    |
>    |source "common.in"
>    |
>    |endif # COMP_1
>
>    $ cat component-2.in
>    |menuconfig COMP_2
>    |    bool
>    |    prompt "comp-2"
>    |
>    |if COMP_2
>    |
>    |config C2_A
>    |    bool
>    |    prompt "C2_A"
>    |
>    |if C2_A
>    |source "common.in"
>    |endif # C2_A
>    |
>    |endif # COMP_2
>
>    $ cat component-3.in
>    |menuconfig COMP_3
>    |    bool
>    |    prompt "comp-3"
>    |
>    |if COMP_3
>    |
>    |config C3_A
>    |    bool
>    |    prompt "C3_A"
>    |
>    |endif # COMP_3
>
>    $ cat common.in
>    |comment "common"
>    |
>    |config ALL_A
>    |    bool
>    |    prompt "All A"
>    ---8<---
>
> [2] Multi-included with a choice:
>    ---8<---
>    $ cat common.in
>    |comment "common"
>    |
>    |choice
>    |    bool
>    |    prompt "Get one free"
>    |
>    |config ALL_A
>    |    bool
>    |    prompt "All A"
>    |
>    |config ALL_B
>    |    bool
>    |    prompt "All B"
>    |
>    |endchoice
>    ---8<---
>
> [3] Conflicting choices:
>    ---8<---
>    $ cat conflict.in
>    |choice
>    |    bool
>    |    prompt "Get one here"
>    |
>    |config C1_A
>    |    bool
>    |    prompt "C1_A"
>    |
>    |config C1_B
>    |    bool
>    |    prompt "C1_B"
>    |
>    |endchoice
>    |
>    |choice
>    |    bool
>    |    prompt "And another one here"
>    |
>    |config C1_A
>    |    bool
>    |    prompt "C1_A"
>    |
>    |config C1_B
>    |    bool
>    |    prompt "C1_B"
>    |
>    |endchoice
>    ---8<---
>
> [4] SAT solver as GSoC 2010:
>    http://www.spinics.net/lists/linux-kbuild/msg02901.html
>    http://userweb.kernel.org/~vegard/gsoc2010/proposal-short.html
> By the way, what is the status of the SAT solver?
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
