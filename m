Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55254 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933339AbbIVNd5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 09:33:57 -0400
Subject: Re: [PATCH v2] Add virt directory to the top Makefile
References: <1442924614-16833-1-git-send-email-feng.wu@intel.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <560158C0.1070409@suse.com>
Date: Tue, 22 Sep 2015 15:33:52 +0200
MIME-Version: 1.0
In-Reply-To: <1442924614-16833-1-git-send-email-feng.wu@intel.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Feng Wu <feng.wu@intel.com>, pbonzini@redhat.com, alex.williamson@redhat.com
Cc: eric.auger@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org

Dne 22.9.2015 v 14:23 Feng Wu napsal(a):
> We need to build files in virt/lib/, so add virt directory to
> the top Makefile.
> 
> Signed-off-by: Feng Wu <feng.wu@intel.com>
> ---
> v2:
> - Remove the explicit 'virt' entry in the KBUILD_ALLDIRS assignment
> - Remove './' in virt/Makefile

Acked-by: Michal Marek <mmarek@suse.com>

Michal

