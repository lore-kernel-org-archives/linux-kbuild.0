Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:37268 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJGjQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 02:39:16 -0400
Date: Sat, 10 Aug 2019 08:39:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] kbuild: detect missing header include guard
Message-ID: <20190810063913.GB13020@ravnborg.org>
References: <20190728173445.10954-1-yamada.masahiro@socionext.com>
 <20190728173445.10954-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728173445.10954-2-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Hi Masahiro

On Mon, Jul 29, 2019 at 02:34:45AM +0900, Masahiro Yamada wrote:
> Our convention is to surround the whole of the header content with an
> include guard. This avoids the same header being parsed over again in
> case it is included multiple times.
> 
> The include guard is missing in several places, or broken due to the
> mismatch between #ifndef and #define.
> 
> The recently added header-test-y syntax allows the comprehensive sanity
> checks of headers. This commit adds another check; if include guard is
> missing, the header will fail to build due to redefinition of something.
> 
> Some headers must be excluded from the test-coverage for now. I will
> let them in after they are fixed.

Smart and simple - nice.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
