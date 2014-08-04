Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60521 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751375AbaHDOKW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Aug 2014 10:10:22 -0400
Message-ID: <53DF944C.2090207@suse.cz>
Date: Mon, 04 Aug 2014 16:10:20 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kbuild: use $(srctree) to locate config headers from
 external modules
References: <1406922443-22770-1-git-send-email-djpohly+linux@gmail.com>
In-Reply-To: <1406922443-22770-1-git-send-email-djpohly+linux@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Devin J. Pohly" <djpohly@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, "Devin J. Pohly" <djpohly+linux@gmail.com>

On 2014-08-01 21:47, Devin J. Pohly wrote:
> When making modules_install for an out-of-tree module, the current
> directory is $(KBUILD_OUTPUT), and the Makefile recipe which verifies
> the existence of files in include/config is unable to find them using a
> relative path.  This leads to a spurious and puzzling "Kernel
> configuration is invalid" warning when no configuration is actually
> needed.

include/generated is located in $(KBUILD_OUTPUT), which is different
from $(srctree) when using O=. Can you post a sequence of commands that
leads to the error you are seeing?

Thanks,
Michal
