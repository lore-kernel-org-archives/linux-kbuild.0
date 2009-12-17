Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:58045 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758309AbZLQCQ3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 21:16:29 -0500
Date: Thu, 17 Dec 2009 01:19:32 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: CONFIG_KPROBES=y build requires gawk
Message-ID: <20091217011932.GT14381@ZenIV.linux.org.uk>
References: <20091216235617.GA12267@hexapodia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091216235617.GA12267@hexapodia.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Isaacson <adi@vmware.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@redhat.com>, Rob Landley <rob@landley.net>

On Wed, Dec 16, 2009 at 03:56:17PM -0800, Andrew Isaacson wrote:
> With CONFIG_KPROBES=y on Ubuntu 9.10 x86_64 default install, I get the
> following:
> 
> Error: Your awk doesn't support charactor-class.
> Please try to use gawk.

Aside of the incorrect suggestion (you need not just gawk, you need that
thing installed as awk), the use of GNUisms in there is actually pointless
since encoding is bloody fixed.
