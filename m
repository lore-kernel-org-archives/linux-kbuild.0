Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:52544 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751045AbZKDIct (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 03:32:49 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 10/10] module: fix is_exported() to return true for all types of exports
Date: Wed, 4 Nov 2009 19:02:49 +1030
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <1257242782-10496-11-git-send-email-alan-jenkins@tuffmail.co.uk>
In-Reply-To: <1257242782-10496-11-git-send-email-alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200911041902.49278.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org

On Tue, 3 Nov 2009 08:36:22 pm Alan Jenkins wrote:
> /proc/kallsyms annotates module symbols as global (e.g. 'D' for a data
> symbol) or local (e.g. 'd'), depending on whether is_exported() returns
> true or false.
> 
> Historically, is_exported() only returns true if the symbol was exported
> using EXPORT_SYMBOL(). EXPORT_SYMBOL_UNUSED(), for example, is not taken
> into account. This looks like an oversight, so let's fix it.
> 
> Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Yep, I noticed the same thing when you patched it.

Thanks!
Rusty.
PS.  Very happy with this series, if no other issues I'll take it happily!
