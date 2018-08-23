Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46257 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726547AbeHWVaq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 17:30:46 -0400
Date: Thu, 23 Aug 2018 19:59:49 +0200
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2] modules_install: make missing $DEPMOD a warning
 instead of error
Message-ID: <20180823175949.GB14106@kroah.com>
References: <490A46D5-834E-46A9-9106-A31F94344F99@goldelico.com>
 <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org>
 <CAK7LNAQDRj7aKMNqkTL3XxbsFHUuYwOaPn8buh=b9O9+CaKjig@mail.gmail.com>
 <61369202-8425-4cb7-aa9d-b83f15c528e0@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61369202-8425-4cb7-aa9d-b83f15c528e0@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>, stable <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Aug 23, 2018 at 10:52:39AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> When $DEPMOD is not found, only print a warning instead of exiting
> with an error message and error status.
> 
> Warning: 'make modules_install' requires /sbin/depmod. Please install it.
> This is probably in the kmod package.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: add missing "exit 0" and update the commit message (no Error).

You need a cc: stable in here too :(
