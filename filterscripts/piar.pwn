#include <a_samp>
#define void%0(%1) forward %0(%1); public %0(%1)
#define SCMAll SendClientMessageToAll
#define SCM SendClientMessage

public OnFilterScriptInit()
{
	SetTimer("PiarTikTok", 1800000, true);
	return 1;
}
void PiarTikTok()
{
	SCMAll(0xFAAC58FF, !"Небольшой пиар моих друзей");
	SCMAll(0xFAAC58FF, !"Wheely_Sampo - {BE2D2D}tiktok.com/@wheely_sampo");
	SCMAll(0xFAAC58FF, !"Borovichok - {9f28fa}tiktok.com/@borovichok_samp");
}
