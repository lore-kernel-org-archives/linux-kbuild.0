Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:34819 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfFDR0B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:26:01 -0400
Date: Tue, 4 Jun 2019 19:25:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] kbuild: add support for ensuring headers are
 self-contained
Message-ID: <20190604172553.GA2383@ravnborg.org>
References: <20190604101409.2078-14-yamada.masahiro@socionext.com>
 <20190604124248.5564-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604124248.5564-1-jani.nikula@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Chris Wilson <chris@chris-wilson.co.uk>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

On Tue, Jun 04, 2019 at 03:42:48PM +0300, Jani Nikula wrote:
> Sometimes it's useful to be able to explicitly ensure certain headers
> remain self-contained, i.e. that they are compilable as standalone
> units, by including and/or forward declaring everything they depend on.
> 
> Add special target header-test-y where individual Makefiles can add
> headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> generate a dummy C file per header that gets built as part of extra-y.
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good, thanks.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
