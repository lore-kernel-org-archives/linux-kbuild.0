Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48065 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757308AbcGZU1b (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 16:27:31 -0400
Subject: Re: [PATCHv2] builddeb: fix file permissions before packaging
References: <57920E64.2030502@suse.com>
 <1469191612-21934-1-git-send-email-henning.schild@siemens.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5797C7A7.90907@suse.com>
Date: Tue, 26 Jul 2016 22:27:19 +0200
MIME-Version: 1.0
In-Reply-To: <1469191612-21934-1-git-send-email-henning.schild@siemens.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Henning Schild <henning.schild@siemens.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 22.7.2016 v 14:46 Henning Schild napsal(a):
> Builddep is not very explicit about file permissions. Actually the file
> permissions in the package are largely influenced by the umask of the
> user cloning the git and building the package. If that umask does not
> set go+r the resulting linux-headers package will prevent non-root users
> from building out-of-tree modules. And that is probably just one
> unexpected effect.
> Being a packaging/install tool builddep should make sure the file
> permissions are set correctly and not just derived from a value that is
> never checked.
> 
> This patch sets ugo read permissions for all packaged files and derives
> the executable bit for directories and executables from the file-owner.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  scripts/package/builddeb | 2 ++
>  1 file changed, 2 insertions(+)

Applied to kbuild.git#misc, thanks.

Michal

