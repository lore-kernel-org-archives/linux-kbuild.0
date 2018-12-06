Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:32938 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbeLFPD1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 10:03:27 -0500
Date: Thu, 6 Dec 2018 07:03:25 -0800
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory
 headers are missing
Message-ID: <20181206150325.GA2726@infradead.org>
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

On Wed, Dec 05, 2018 at 08:28:05PM +0900, Masahiro Yamada wrote:
> Some time ago, Sam pointed out a certain degree of overwrap between
> generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)
> 
> I a bit tweaked the meaning of mandatory-y; now it defines the minimum
> set of ASM headers that all architectures must have.
> 
> If arch does not have specific implementation of a mandatory header,
> Kbuild will let it fallback to the asm-generic one by automatically
> generating a wrapper. This will allow to drop lots of redundant
> generic-y defines.
> 
> Previously, "mandatory" was used in the context of UAPI, but I guess
> this can be extended to kernel space ASM headers.

How useful is it to keep the generic-y behavior around at all vs making
everything useful mandatory?
