Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:18140 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751468Ab3GHNcQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jul 2013 09:32:16 -0400
Message-ID: <51DABF5C.3080502@redhat.com>
Date: Mon, 08 Jul 2013 09:32:12 -0400
From: Doug Ledford <dledford@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: add generation of kernel-devel
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com> <51D5919B.7010208@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DC69@FMSMSX107.amr.corp.intel.com> <51DAACB9.5080103@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DD48@FMSMSX107.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC2115DD48@FMSMSX107.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarcini@yahoo.com" <mmarcini@yahoo.com>

On 07/08/13 09:15, Marciniszyn, Mike wrote:
>  
>> You can say '%exclude /some/path' to exclude a path that would otherwise
>> match an earlier pattern. But I do not know since when RPM supports this. If
>> there is a risk of breaking make rpm on older systems, then let's leave it as is.
> 
> This looks to be an RPM 4.0.3 feature.
> 
> 
> I agree.
> 
> Mike
> 

rpm 4.0.3 is *ancient*.  An %exclude is perfectly acceptable and
definitely preferable to a broken payload.

-- 
Doug Ledford <dledford@redhat.com>
              GPG KeyID: 0E572FDD
	      http://people.redhat.com/dledford

