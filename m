Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30106 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbdFPAab (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2017 20:30:31 -0400
MIME-Version: 1.0
In-Reply-To: <1497445867.6424.36.camel@synopsys.com>
References: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
 <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com> <1497445867.6424.36.camel@synopsys.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Jun 2017 09:29:51 +0900
Message-ID: <CAK7LNARgbncLWQvGoR82hVGMOj4yggcvQQZB=aw6yEi-SE0zCw@mail.gmail.com>
Subject: Re: [PATCH] Unexport LANG env variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "mmarek@suse.com" <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>

Hi Alexey,


2017-06-14 22:11 GMT+09:00 Alexey Brodkin <Alexey.Brodkin@synopsys.com>:
> Hi Michal,
>
> On Wed, 2017-06-14 at 15:02 +0200, Michal Marek wrote:
>> Dne 14.6.2017 v 14:40 Alexey Brodkin napsal(a):
>> >
>> > In those cases when we parse output of standard utilities like readelf
>> > etc we rely on a particular sentences. For example for ARC we extract
>> > an entry-point from vmlinux like that:
>> > ---------------------->8--------------------
>> > readelf -h vmlinux | grep "Entry point address" | grep -o 0x.*
>> > ---------------------->8--------------------
>> >
>> > And in case LANG is set to anything other than en_XX we're getting
>> > nothing and subsequent execution of mkimage utility fails.
>> >
>> > Probably there're more cases like that but given people rarely
>> > use non-English locales on their dev machines problems like the one
>> > above are not very visible.
>>
>> I'm all for this change but the *.po files in the gcc tree must have
>> been created for a reason:
>>
>>   https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_gcc-2Dmirror_gcc_tree_master_gcc_po&d=DwICBA&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes
>> 0GFDDl656eViXO7breS55ytWkhpk5R81I&m=v2ilYYv6Z0WzVaIys3sCQdK3QBI9gqH7hUmoTGPpJ44&s=S3B79SHovtt1-wLRtngTUM0dKWMiokGE75HIrfgkbbc&e=
>
> That's for sure.
>
> But then how may we have a predictable environment for our machinery?
>
> I do realize that with that change in place people will start seeing
> non-translated messages from other tools like compiler etc.
>
> But probably that's not the worst idea as well because it helps googling :)


I do not want to lose users' freedom to choose their favorite language.


For example, arch/powerpc/boot/wrapper  does this

LANG=C elfformat="`${CROSS}objdump -p "$kernel" | grep 'file format' |
awk '{print $4}'`"


I think you can solve your problem like that.


-- 
Best Regards
Masahiro Yamada
