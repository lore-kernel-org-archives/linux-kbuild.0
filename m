Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:42056 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfJ3D7B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 23:59:01 -0400
Subject: Re: [PATCH] scripts:prune-kernel:prune kernel and modules dir from
 the system
References: <20191029030030.31659-1-unixbhaskar@gmail.com>
 <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
 <20191030024312.GA1251@ArchLinux>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d9f7acd6-e948-4eb7-41ef-4d9a2cafe15a@infradead.org>
Date: Tue, 29 Oct 2019 20:58:56 -0700
MIME-Version: 1.0
In-Reply-To: <20191030024312.GA1251@ArchLinux>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/29/19 7:43 PM, Bhaskar Chowdhury wrote:
> On 17:05 Tue 29 Oct 2019, Randy Dunlap wrote:
> 
>> Hi,
> Thank you Randy, my answers are inline , kindly look.
> 
> The modified version(implemented your suggestions) of the script and their interaction will send in next patch mail.
>>
>>
>> This patch does not delete the original script loop, so that still follows
>> after the 'done' above.  Was that intentional?
> This is confuse me! not sure  what you meant. Did you meant to say
> the do loop inside does not match with this pair???

I mean that the old loop that begins with
for f in "$@"

is still there after your patch.


-- 
~Randy
