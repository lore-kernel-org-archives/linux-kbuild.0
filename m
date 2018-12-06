Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:35961 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbeLFSFK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 13:05:10 -0500
Date: Thu, 6 Dec 2018 19:04:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory
 headers are missing
Message-ID: <20181206180459.GA19166@ravnborg.org>
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

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
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Nice work!

For the full series:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Have you considered to warn if generic-y contains a header listed
in mandatory-y - to prevent that they sneak back in.
And to catch when we lift a header from available to mandatory.

	Sam
