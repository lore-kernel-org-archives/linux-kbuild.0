Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44441 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751531Ab0KZRTV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 12:19:21 -0500
Message-ID: <4CEFEC12.9060100@redhat.com>
Date: Fri, 26 Nov 2010 15:19:14 -0200
From: Mauro Carvalho Chehab <mchehab@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's visibility
References: <4CD300AC.3010708@redhat.com> <1289079027-3037-2-git-send-email-lacombar@gmail.com> <AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com> <4CEF8C74.8010600@suse.cz> <20101126161511.GD9418@sepie.suse.cz>
In-Reply-To: <20101126161511.GD9418@sepie.suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org

Em 26-11-2010 14:15, Michal Marek escreveu:
> On Fri, Nov 26, 2010 at 11:31:16AM +0100, Michal Marek wrote:
>> On 25.11.2010 18:06, Arnaud Lacombe wrote:
>>> Hi folks,
>>>
>>> On Sat, Nov 6, 2010 at 5:30 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
>>>> This option is aimed to add the possibility to control a menu's visibility
>>>> without adding dependency to the expression to all the submenu.
>>>>
>>>> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>>>> ---
>>>>  scripts/kconfig/expr.h      |    1 +
>>>>  scripts/kconfig/lkc.h       |    1 +
>>>>  scripts/kconfig/menu.c      |   11 +++++++++++
>>>>  scripts/kconfig/zconf.gperf |    1 +
>>>>  scripts/kconfig/zconf.y     |   21 ++++++++++++++++++---
>>>>  5 files changed, 32 insertions(+), 3 deletions(-)
>>>>
>>> As there seem to be no interested from Michal to either, ACK, NACK, or
>>> even comment this series, please let me withdraw these patches. If
>>> this mail is not enough to void the patch, I hope to still be able to
>>> withdraw my Signed-off-by from this particular series, and thus no
>>> longer be able to certify the origin of the patches to prevent their
>>> merge.
>>
>> Hi Arnaud,
>>
>> I'm sorry, I was sick for longer time and am now going through the
>> patches that accumulated during that time. I understand your
>> frustration, but the fact that I commented / applied some other patches
>> yesterday and not this one does not mean that I'm ignoring it. Please
>> accept my apologies, I'm looking at your patch right now...
> 
> So the patches look OK to me, I added your patches to
> kbuild-2.6.git#menu-visibility and merged the branch to for-next. The
> new syntax should be documented in
> Documentation/kbuild/kconfig-language.txt, below is a first attempt at
> it. If the patches work fine in linux-next _and_ you give me permission
> to push them to Linus, I'll move them to rc-fixes and send a pull
> request.
> 
> Michal
> 
> 
> Subject: [PATCH] kconfig: Document the new "visible if" syntax
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>

Seems ok to me. I would just add a note, as reminded by Randy, that
visible is the default. Anyway,

Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>

> 
> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 2fe93ca..2522cca 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -114,6 +114,13 @@ applicable everywhere (see syntax).
>  	the illegal configurations all over.
>  	kconfig should one day warn about such things.
>  
> +- limiting menu display: "visible if" <expr>
> +  This attribute is only applicable to menu blocks, if the condition is
> +  false, the menu block is not displayed to the user (the symbols
> +  contained there can still be selected by other symbols, though). It is
> +  similar to a conditional "prompt" attribude for individual menu
> +  entries.
> +
>  - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
>    This allows to limit the range of possible input values for int
>    and hex symbols. The user can only input a value which is larger than
> @@ -300,7 +307,8 @@ menu:
>  	"endmenu"
>  
>  This defines a menu block, see "Menu structure" above for more
> -information. The only possible options are dependencies.
> +information. The only possible options are dependencies and "visible"
> +attributes.
>  
>  if:
>  

