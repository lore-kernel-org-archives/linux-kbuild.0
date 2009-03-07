Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:45726 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752178AbZCGM5Z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 7 Mar 2009 07:57:25 -0500
Date: Sat, 7 Mar 2009 13:59:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Fix mkspec to cleanup RPM_BUILD_ROOT
Message-ID: <20090307125921.GB6029@uranus.ravnborg.org>
References: <20090222185455.GB17685@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090222185455.GB17685@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Hunt <josh@scalex86.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kiran@scalex86.org, mingo@elte.hu

On Sun, Feb 22, 2009 at 10:54:55AM -0800, Josh Hunt wrote:
> The contents of the %clean section in mkspec is currently commented
> out leaving RPM_BUILD_ROOT and its contents on the build machine.
> This patch removes it once the rpm build process is complete.
> 
> Signed-off-by: Josh Hunt <josh@scalex86.org>

Applied,
	Sam
