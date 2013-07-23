Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39837 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932148Ab3GWNTX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Jul 2013 09:19:23 -0400
Message-ID: <51EE82D5.8030602@suse.cz>
Date: Tue, 23 Jul 2013 15:19:17 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] kbuild: add %post section to create initramfs and
 grub hooks
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143822.10761.47446.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130624143822.10761.47446.stgit@phlsvslse11.ph.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Doug Ledford <dledford@redhat.com>, linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

On 24.6.2013 16:38, Mike Marciniszyn wrote:
> /sbin/installkernel is used to insure grub hooks are
> inserted and the initramfs is created on the
> target system.
> 
> The invokation installkernel will work with any
> kernel as long as:
> - /sbin/installkernel exists
> - the kernel and sysem map files are readable
> 
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>

Applied to kbuild.git#misc.

Michal

