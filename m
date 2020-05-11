Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730974AbgEKTRO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 15:17:14 -0400
Date: Mon, 11 May 2020 15:17:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v5] streamline_config.pl: add LMC_KEEP to preserve some
 kconfigs
Message-ID: <20200511151712.21a767d9@gandalf.local.home>
In-Reply-To: <20200510010603.3896-1-changbin.du@gmail.com>
References: <20200510010603.3896-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

On Sun, 10 May 2020 09:06:03 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
> 
>  $ make LMC_KEEP="drivers/usb:fs" localmodconfig
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> 


Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
