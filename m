Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:47131 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757286AbZKRVVY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2009 16:21:24 -0500
Date: Wed, 18 Nov 2009 13:20:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Kbuild: clean up marker
Message-Id: <20091118132053.87e817dc.akpm@linux-foundation.org>
In-Reply-To: <1258350595-19285-1-git-send-email-wenji.huang@oracle.com>
References: <1258350595-19285-1-git-send-email-wenji.huang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wenji Huang <wenji.huang@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Mon, 16 Nov 2009 13:49:54 +0800
Wenji Huang <wenji.huang@oracle.com> wrote:

> Drop Module.markers from cleaning list.

The changelog failed to explain the reason for this change.  Please
always include that vital information in changelogs.

I, for one, don't have a clue why you made this change.

