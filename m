Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39866 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932180Ab3GWNTn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Jul 2013 09:19:43 -0400
Message-ID: <51EE82EB.3020209@suse.cz>
Date: Tue, 23 Jul 2013 15:19:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] kbuilld: install firmware files in kernel relative
 directory
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143828.10761.20718.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130624143828.10761.20718.stgit@phlsvslse11.ph.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Doug Ledford <dledford@redhat.com>, linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

On 24.6.2013 16:38, Mike Marciniszyn wrote:
> Prior to this patch, firmware files were being installed
> in /lib/firmware with a potential conflict with already
> installed kernels.
> 
> firmware files are now installed in /lib/firmware/<release>
> and packaged with the rest of the modules.
> 
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>

Applied to kbuild.git#misc.

Michal

