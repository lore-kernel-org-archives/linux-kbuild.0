Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53217 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753717AbaHUDZc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Aug 2014 23:25:32 -0400
Date: Thu, 21 Aug 2014 12:25:21 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: Make scripts executable
In-Reply-To: <1408543848-24977-1-git-send-email-mmarek@suse.cz>
References: <1408543848-24977-1-git-send-email-mmarek@suse.cz>
Message-Id: <20140821122521.2D67.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michal,


On Wed, 20 Aug 2014 16:10:48 +0200
Michal Marek <mmarek@suse.cz> wrote:

> The Makefiles call the respective interpreter explicitly, but this makes
> it easier to use the scripts manually.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>


I am not sure at all, but
it seems scripts/checkpatch.pl has a rule
to ban execute permissions.


# Check for incorrect file permissions
                if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
                        my $permhere = $here . "FILE: $realfile\n";
                        if ($realfile !~ m@scripts/@ &&
                            $realfile !~ /\.(py|pl|awk|sh)$/) {
                                ERROR("EXECUTE_PERMISSIONS",
                                      "do not set execute permissions for source files\n" . $permhere);
                        }
                }



Best Regards
Masahiro Yamada
