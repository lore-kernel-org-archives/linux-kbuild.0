Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47902 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757832Ab3AOW2x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jan 2013 17:28:53 -0500
Message-ID: <50F5D81C.1070702@suse.cz>
Date: Tue, 15 Jan 2013 23:28:44 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] menuconfig:inputbox: support navigate input position
References: <20121217143802.GB16993@udknight> <201212171922.59669.yann.morin.1998@free.fr>
In-Reply-To: <201212171922.59669.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Wang YanQing <udknight@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

On 17.12.2012 19:22, Yann E. MORIN wrote:
> Wang, All,
> 
> On Monday 17 December 2012 Wang YanQing wrote:
>> This patch add support navigate input position *inside* the input
>> field with LEFT/RIGHT, so it is possible to modify the text in place.
>>
>> Signed-off-by: Wang YanQing <udknight@gmail.com>
> 
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I am not knowledgeable enough in ncurses and the dialog code-base
> to add any reviewed-by tag. All I can say, is that it works as
> advertised.

I merged this into kbuild.git#kconfig.

Thanks,
Michal

