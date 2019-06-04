Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:35511 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfFDR5L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:57:11 -0400
Date: Tue, 4 Jun 2019 19:57:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/15] kbuild: remove headers_{install,check}_all
Message-ID: <20190604175706.GA4093@ravnborg.org>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
 <20190604101409.2078-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604101409.2078-2-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

On Tue, Jun 04, 2019 at 07:13:55PM +0900, Masahiro Yamada wrote:
> headers_install_all does not make much sense any more because different
> architectures export different set of uapi/linux/ headers. As you see
> in include/uapi/linux/Kbuild, the installation of a.out.h, kvm.h, and
> kvm_para.h is arch-dependent. So, headers_install_all repeats the
> installation/removal of them.
> 
> If somebody really thinks it is useful to do headers_install for all
> architectures, it would be possible by small shell-scripting, but the
> top Makefile do not have to provide entry targets just for that purpose.
Agreed, good to see this be dropped.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
