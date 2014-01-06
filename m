Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:46383 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756312AbaAFVd5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jan 2014 16:33:57 -0500
Date: Mon, 6 Jan 2014 16:33:49 -0500
From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: #pragma once?
Message-ID: <20140106213349.GF28490@thunk.org>
References: <20140106204706.GA16924@leaf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140106204706.GA16924@leaf>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Rashika Kheria <rashika.kheria@gmail.com>

On Mon, Jan 06, 2014 at 12:47:07PM -0800, Josh Triplett wrote:
> Does anyone have any objection to the use of "#pragma once" instead of
> the usual #ifndef-#define-...-#endif include guard?  GCC, LLVM/clang,
> and the latest Sparse all support either method just fine.  (I added
> support to Sparse myself.)  Both have equivalent performance.  "#pragma
> once" is simpler, and avoids the possibility of a typo in the defined
> guard symbol.

Does anybody know whether other static code analysis tools such as
Coverity can handle #pragma once?

						- Ted
