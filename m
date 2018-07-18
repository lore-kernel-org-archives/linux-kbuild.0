Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23439 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbeGRGDL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 02:03:11 -0400
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com [209.85.217.172]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w6I5R0Pv029425
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jul 2018 14:27:01 +0900
Received: by mail-ua0-f172.google.com with SMTP id r10-v6so2178907uao.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jul 2018 22:27:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180712221730.GK14131@decadent.org.uk>
References: <20180712221619.GH14131@decadent.org.uk> <20180712221730.GK14131@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 18 Jul 2018 14:26:19 +0900
Message-ID: <CAK7LNAR6qiZ1hZr-Qu1o8Ks5Sr1ejs2Wv--1zLrh9fyot7KnXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] kbuild: In quiet mode, print the full command
 line if it fails
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-07-13 7:17 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> In the $(run-cmd) macro, add a trap on EXIT that prints the
> full command line.  Remove the trap after running the command(s)
> successfully.
>
> (A more straightforward approach would be to use "if" or "||" to test
> for failure, but that doesn't work.  Some command lines given to
> $(run-cmd) have multiple commands separated by semi-colons, and the
> caller must run "set -e" to enable exit-on-error.  Testing the result
> of such a command line, even if it is probably grouped and run in a
> sub-shell, inhibits exit-on-error and would cause some errors to be
> ignored.)
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

OK, this seems useful to me.


> ---
>  scripts/Kbuild.include | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8778ae4a3476..c2525aaa36ac 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -224,7 +224,10 @@ flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))
>  echo-cmd = $(if $($(quiet)cmd_$(1)),\
>         echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
>
> -run-cmd = $(echo-cmd) $(cmd_$(1))
> +trap-cmd-failed = trap 'test $$? = 0 || echo Failed command: '\''$(call escsq,$(call escsq,$(cmd_$(1))))'\' EXIT
> +untrap-cmd-failed = trap - EXIT


Why $(call escsq,...) twice?


I think
... echo Failed command: '\''$(call escsq,$(cmd_$(1)))'\' EXIT
is enough.



I see another problem for this.
Make cannot detect the failure of $(call cmd,...)



--------------(sample code)---------------

extra-y := foo.txt

quiet_cmd_always_fail = FAIL    $@
      cmd_always_fail = /bin/false

$(obj)/foo.txt:
        $(call cmd,always_fail)

------------(sample code end)-------------



This should terminate the build.


With your series, this always succeeds
because it returns the exit code of 'trap - EXIT', which is 0.


Maybe,
$(cmd_$(1)) && $(untrap-cmd-failed)
?







> +
> +run-cmd = $(echo-cmd) $(if $(cmd_$(1)), $(if $(quiet), $(trap-cmd-failed); $(cmd_$(1)); $(untrap-cmd-failed), $(cmd_$(1))))
>
>  # printing commands
>  cmd = @$(run-cmd)



-- 
Best Regards
Masahiro Yamada
