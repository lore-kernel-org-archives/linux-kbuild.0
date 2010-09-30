Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:57270 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753694Ab0I3HCA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Sep 2010 03:02:00 -0400
Date: Thu, 30 Sep 2010 16:01:50 +0900
From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: [PATCH 1/4] Fix wrong source path in scripts/namespace.pl
Message-ID: <20100930160150.66cf0672@s6510>
In-Reply-To: <1285828138-5873-1-git-send-email-amwang@redhat.com>
References: <1285828138-5873-1-git-send-email-amwang@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amerigo Wang <amwang@redhat.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org

On Thu, 30 Sep 2010 14:28:55 +0800
Amerigo Wang <amwang@redhat.com> wrote:

> File::Find will do chdir automatically, so we need to get
> the absolute patch with $File::Find::dir.
> 
> Reported-by: Stephen Hemminger <shemminger@vyatta.com>
> Signed-off-by: Amerigo Wang <amwang@redhat.com>

Works for me.
