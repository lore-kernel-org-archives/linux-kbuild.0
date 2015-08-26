Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54979 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751995AbbHZJ1t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Aug 2015 05:27:49 -0400
Date: Wed, 26 Aug 2015 11:27:47 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: avoid listing /lib/modules in kernel spec file
Message-ID: <20150826092747.GA27121@sepie.suse.cz>
References: <20150813211610.11760.6911.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150813211610.11760.6911.stgit@phlsvslse11.ph.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: dledford@redhat.com, linux-kbuild@vger.kernel.org

On Thu, Aug 13, 2015 at 05:16:10PM -0400, Mike Marciniszyn wrote:
> This causes conflicts when using multiple kernels built
> with this mechanism.
> 
> Reviewed-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>

It's not obvious to me which file conflict you are getting, but you are
right that the directory does not have to be in the package. Applied to
kbuild.git#misc.

Michal
