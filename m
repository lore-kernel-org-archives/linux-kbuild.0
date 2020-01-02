Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:42264 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgABQOq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 11:14:46 -0500
Subject: Re: [PATCH] menuconfig: restore prompt dependencies in help text
References: <20191231055839.GG4203@ZenIV.linux.org.uk>
 <20200101204152.402906-1-nivedita@alum.mit.edu>
 <20200101210426.GA8904@ZenIV.linux.org.uk>
 <20200101222644.GA438328@rani.riverdale.lan>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
Date: Thu, 2 Jan 2020 08:14:43 -0800
MIME-Version: 1.0
In-Reply-To: <20200101222644.GA438328@rani.riverdale.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Sankar <nivedita@alum.mit.edu>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org

On 1/1/20 2:26 PM, Arvind Sankar wrote:
> On Wed, Jan 01, 2020 at 09:04:26PM +0000, Al Viro wrote:
>> On Wed, Jan 01, 2020 at 03:41:52PM -0500, Arvind Sankar wrote:
>>> Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
>>> prompts") moved some code from get_prompt_str to get_symbol_str so that
>>> dependency information for symbols without prompts could be shown.
>>>
>>> This code would be better copied rather than moved, as the change had
>>> the side-effect of not showing any extra dependencies that the prompt
>>> might have over the symbol.
>>>
>>> Put back a copy of the dependency printing code in get_prompt_str.
>>
>> Umm... Is "visible" really accurate in this case?  AFAICS, the
>> entry (and help for it) _is_ visible with EXPERT=n.  OTOH, with
>> EXPERT=y and MULTIUSER=n it disappears completely.
>>
>> I'm not familiar with kconfig guts (and not too concerned about that
>> feature of help there, TBH), but it looks like what you are printing
>> there is some mix of dependencies ("visible when") and selectability...
> 
> Perhaps not the most accurate term. For NAMESPACES it has a submenu, so
> it can't disappear as long as its selected, even if it's not editable
> any more. A "leaf" level option like MULTIUSER, otoh, does disappear
> completely (even though it's still selected).
> 
> But there are also things like CONFIG_VT, which stays visible, even
> though its not a menu.. I think because there is a visible option that
> depends on it and immediately follows, which menuconfig shows by
> indenting. If the order of UNIX98_PTYS and VT_HW_CONSOLE_BINDING is
> flipped in drivers/tty/Kconfig, then VT disappears when EXPERT=n.
> 
> Dunno, maybe Editable would be a better word than Visible?

I would prefer Editable instead of Visible.

and the Subject should be more than menuconfig since the patch also
"fixes" nconfig, xconfig, and gconfig.


Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
