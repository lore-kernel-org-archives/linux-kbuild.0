Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46519 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752457AbcDTIEN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 04:04:13 -0400
Date: Wed, 20 Apr 2016 10:04:09 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild/mkspec: support 'update-bootloader'-based
	systems
Message-ID: <20160420080409.GB15339@pobox.suse.cz>
References: <alpine.LNX.2.00.1604071459520.27368@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1604071459520.27368@cbobk.fhfr.pm>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 07, 2016 at 03:00:54PM +0200, Jiri Kosina wrote:
> From: Jiri Kosina <jkosina@suse.cz>
> 
> When uninstalling kernel RPM, we're unconditionally calling 
> "new-kernel-pkg --remove".

There is of course a test whether the script exists.


> This is useless on systems which are based on 
> 'update-bootloader' script instead.

Right.

 
> Support update-bootloader removal method as well in case the script is 
> present; contrary to new-kernel-pkg, this needs to be done in %postun, 
> otherwise update-bootloader will refuse to remove entry for kernel for 
> which the binary still exists.
> 
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>

Applied to kbuild.git#misc. Let's see what other rpm-based distros are
going to need.

Michal
