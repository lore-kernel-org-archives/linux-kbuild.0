Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56238 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751817Ab3GHMMq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jul 2013 08:12:46 -0400
Message-ID: <51DAACB9.5080103@suse.cz>
Date: Mon, 08 Jul 2013 14:12:41 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: add generation of kernel-devel
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com> <51D5919B.7010208@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DC69@FMSMSX107.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC2115DC69@FMSMSX107.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: Doug Ledford <dledford@redhat.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarcini@yahoo.com" <mmarcini@yahoo.com>

On 8.7.2013 13:55, Marciniszyn, Mike wrote:
>> For consistency and compatibility with older tar versions, please
>> use $RCS_TAR_EXCLUDE instead of --exclude-vcs. Also, you only need
>> .config, scripts/, include/ and the Makefiles to build external
>> modules. But that's an optimization that can be done in a later
>> patch.
>> 
> 
> In v2 of the patch.
> 
>> 
>> These symlinks should be part of the RPM payload.
>> 
> 
> This is also in v2 of the same patch.  The %post and %postun
> scriptlets are no longer there.
> 
> These is one minor oddity in that the symlinks are in the main
> package because of that packages file selection.   Those symlinks
> will dangle until the devel package is installed.
> 
> It might be possible to adjust the file lists of both, but I was wary
> of creating a more explicit list in the main package because of a
> potential maintenance issue as "install" payload changes.

You can say '%exclude /some/path' to exclude a path that would otherwise
match an earlier pattern. But I do not know since when RPM supports
this. If there is a risk of breaking make rpm on older systems, then
let's leave it as is.

Michal
