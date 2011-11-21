Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail202c2.megamailservers.com ([69.49.111.103]:56827 "EHLO
	mail202c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755234Ab1KULLW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 06:11:22 -0500
Message-ID: <4ECA2FF6.2090708@gaisler.com>
Date: Mon, 21 Nov 2011 12:03:18 +0100
From: Konrad Eisele <konrad@gaisler.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kconfig: Add a configuration subtree command to kconfig
References: <1321625774-12749-1-git-send-email-konrad@gaisler.com> <4EC69F65.20207@xenotime.net> <4EC6E179.1030703@gaisler.com> <CACqU3MV=XzNUv70vP7QtQwC2xgqnY0bX+orDA+aErmJGwdEA_w@mail.gmail.com> <4EC76049.8020508@gaisler.com> <4EC9024A.7070807@suse.cz>
In-Reply-To: <4EC9024A.7070807@suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, linux kbuild list <linux-kbuild@vger.kernel.org>, pefoley2@verizon.net, yann.morin.1998@anciens.enib.fr, sam@ravnborg.org, zippel@linux-m68k.org

Michal Marek wrote:
> On 19.11.2011 08:52, konrad.gaisler wrote:
>> On 11/19/2011 07:23 AM, Arnaud Lacombe wrote:
>>> On Fri, Nov 18, 2011 at 5:51 PM, konrad.gaisler<konrad@gaisler.com>  wrote:
>>>> As an example, apply the patch, then add to<top>/Kconfig the lines:
>>>>
>>>> subsource "arch/sparc/Kconfig" "." ".config_sparc" "SPARC config" SPARC_
>>>> CONFIG_
>>>> subsource "arch/mips/Kconfig" "." ".config_mips" "MIPS config" MIPS_ CONFIG_
>>>>
>>> ETOOMUCHARGUMENT!
>>>
>>> I wonder if we could not get all these parameters specified
>>> dynamically in the Kconfig. This would replace the `mainmenu' entry
>>> ala:
>>>
>>> config
>>>      title "Linux ..."
>>>      prefix "CONFIG_"
>>>      file .config
>>> endconfig
>> Yes maybe it can be done that way. Personally I think it is
>> more difficult.
> 
> A <command> <argument> syntax fits well into the existing Kconfig
> language and it more readable, as you don't have to count the position
> of the arguments and check their meaning in the documentation.
> 
> Michal
> 
> 

Ok, I'll do it with "Config" and type "title". It will
take a while until I have a new patch...
-- Konrad
