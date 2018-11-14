Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43718 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbeKOJVh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 04:21:37 -0500
Subject: Re: hidden string Kconfig ?
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
Date: Wed, 14 Nov 2018 15:16:17 -0800
MIME-Version: 1.0
In-Reply-To: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Walker <danielwa@cisco.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

On 11/14/18 2:32 PM, Daniel Walker wrote:
> Hi,
> 
> 
> I'm trying to find out if it's possible to have a string in Kconfig which is
> hidden from the menu, but still exists in the .config? 
> 
> Like,
> 
> HIDDEN_STRING
> 	string
> 
> then in the config file there would be,
> CONFIG_HIDDEN_STRING="hidden"
> 
> and the config option wouldn't be used for anything inside Kconfig. It would
> just get set from the .config , or not be set?
> 
> The above sample, I've not been able to make work. The string in the .config
> gets erased when menuconfig runs.
> 
> Any help appreciated.

Hi,

There are several "string" Kconfig symbols in init/Kconfig that do not have
a prompt string after them.  I believe that these do what you are asking about.
If not, please provide your example that is not working.

Or:  this one works for me:

---
 init/Kconfig |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20181114.orig/init/Kconfig
+++ linux-next-20181114/init/Kconfig
@@ -1858,6 +1858,10 @@ config CMDLINE
 
 endif
 
+config SPECIAL_STRING
+	string
+	default "special"
+
 endmenu		# General setup
 
 source "arch/Kconfig"


and "make oldconfig" gives me a .config file that contains:
CONFIG_SPECIAL_STRING="special"


HTH.  or ask more questions...

-- 
~Randy
