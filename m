Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39764 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbfC1NgV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Mar 2019 09:36:21 -0400
Subject: Re: [PATCH v2] kbuild: strip whitespace in cmd_record_mcount
 findstring
References: <20190325160438.8982-1-joe.lawrence@redhat.com>
 <CAK7LNARyD=tG0JhwN_mjdyDRSPAF8UoZKvqAT3Ah_v7GfymCPg@mail.gmail.com>
 <20190326173308.GA26546@redhat.com>
 <CAK7LNAT4VTUOtjEvJfe9+7yNemkodUnDo6bMoKxSgqGq7H4mOQ@mail.gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <4f13ecb6-9aa8-5037-a18e-150c026254c2@redhat.com>
Date: Thu, 28 Mar 2019 09:36:16 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT4VTUOtjEvJfe9+7yNemkodUnDo6bMoKxSgqGq7H4mOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

On 3/28/19 8:57 AM, Masahiro Yamada wrote:
> Hi Joe,
> 
> OK, confirmed.
 >
 > [ ... snip .... ]
> 
> First, I was wondering why I could not reproduce this issue.
> Then, I found the reason was I was using the latest GNU Make
> compiled from the git source tree.
> 
> I found the following commit:
> 
> commit b90fabc8d6f34fb37d428dc0fb1b8b1951a9fbed
> Author: Paul Smith <psmith@gnu.org>
> Date:   Sat May 27 20:07:30 2017 -0400
> 
>      * NEWS: Do not insert a space during '+=' if the value is empty.
> 
>      * doc/make.texi (Appending): Document this behavior.
>      * variable.c (do_variable_definition): Only add a space if the variable
>      value is not empty.
>      * tests/scripts/variables/flavors: Test this behavior.
> 
> diff --git a/NEWS b/NEWS
> index e60644a..6e2c5c6 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -29,6 +29,12 @@
> http://sv.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=108&set
>     This was claimed to be fixed in 3.81, but wasn't, for some reason.
>     To detect this change search for 'nocomment' in the .FEATURES variable.
> 
> +* WARNING: Backward-incompatibility!
> +  Previously appending using '+=' to an empty variable would result in a value
> +  starting with a space.  Now the initial space is only added if the variable
> +  already contains some value.  Similarly, appending an empty string does not
> +  add a trailing space.
> +
>   * The previous limit of 63 jobs under -jN on MS-Windows is now
>     increased to 4095.  That limit includes the subprocess started by
>     the $(shell) function.
> 
> Applied to linux-kbuild/fixes with additional comments.
> 
> [Additional info by masahiro.yamada:
> This issue only happens in the released versions of GNU Make.
> CC_FLAGS_FTRACE will not contain the trailing space if you use
> the latest GNU Make, which contains commit b90fabc8d6f3
> ("* NEWS: Do not insert a space during '+=' if the value is empty.")
> ]
Wow, this one gets even more specific.  I had gone down the rabbit hole 
on this one, I didn't care to learn how or why that extra space got 
there :)  Now we know, thanks for running that down and adding the note 
about GNU Make.

-- Joe
