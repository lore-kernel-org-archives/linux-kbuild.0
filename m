Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41852 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752421AbbBRPFu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 10:05:50 -0500
Message-ID: <54E4AA4C.4050509@suse.cz>
Date: Wed, 18 Feb 2015 16:05:48 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] kbuild: make it possible to specify the module output dir
References: <1423479528-27027-1-git-send-email-kumarsharma.r@gmail.com>
In-Reply-To: <1423479528-27027-1-git-send-email-kumarsharma.r@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kiran Raparthy <kumarsharma.r@gmail.com>, linux-kernel@vger.kernel.org
Cc: Rom Lemarchand <romlem@android.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Android Kernel Team <kernel-team@android.com>

On 2015-02-09 11:58, Kiran Raparthy wrote:
> From: Rom Lemarchand <romlem@android.com>
> 
> kbuild: make it possible to specify the module output dir
> 
> Make modinst_dir user-defined on the command line.
> 
> This allows to do things like:
> make MODLIB=output/ modinst_dir=. modules_install
> 
> to ensure all the .ko are in the output/ directory.

Please explain the use case and why it is needed. There are two
user-changeable variables used by modules_install:

INSTALL_MOD_PATH - prepended to /lib/modules/..., to allow installation
                   to a staging directory by non-root
INSTALL_MOD_DIR  - for out-of-tree modules; specifies the subdirectory
                   of /lib/modules/.../ to put the modules under
                   (default: "extra").

The hierarchy used in the source tree is reflected under
/lib/modules/.../extra, but that should not be an issue.

Michal
